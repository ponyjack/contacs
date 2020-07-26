import pymysql
import pyexcel
from xpinyin import Pinyin
import unicodedata
import re
import glob

p = Pinyin()


def importdata():
    connection = pymysql.connect(
        host="cdb-i5kqhoo7.gz.tencentcdb.com",
        port=10150,
        user="hello",
        password="hello_hello",
        db="jeecg-boot",
        charset="utf8mb4",
        cursorclass=pymysql.cursors.DictCursor,
    )

    for v in glob.glob("*.xlsx"):
        importjifang(connection, v)


def GetKey(key):
    cname = unicodedata.normalize("NFKD", key)
    cname = re.sub(r"\([^\)]*\)", "", cname)
    cname = cname.strip()
    cname = cname.replace("-", "_")
    return p.get_pinyin(cname, "_")


def importjifang(mysql, datafile):
    records = pyexcel.get_records(file_name=datafile)
    rkeys = {}
    for k in records[0].keys():
        rkeys[k] = GetKey(k)

    name = datafile.split("_")[0]
    tbname = p.get_pinyin(name, "")
    tbname = "jt_" + tbname

    # print(keys)
    for i, r in enumerate(records):
        if i < 4:
            continue

        keys = []
        values = []
        for k, v in r.items():
            if v:
                keys.append(rkeys[k])
                values.append(v)
        keysname = ", ".join(keys)
        valuesdata = ", ".join(["'" + v + "'" for v in values])
        sql = f"""INSERT INTO {tbname} ({keysname})
        VALUES
        ({valuesdata}) ;"""
        print(sql)
        with mysql.cursor() as cursor:
            cursor.execute(sql)
        mysql.commit()

    #     break


if __name__ == "__main__":
    importdata()

