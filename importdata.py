import pymysql
import pyexcel
from xpinyin import Pinyin

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
    importjifang(connection)


def importjifang(mysql):
    records = pyexcel.get_records(file_name="物理站点_2020-07-18.xlsx")

    for i, r in enumerate(records):
        if i < 4:
            continue

        keys = []
        values = []
        for k, v in r.items():
            if v:
                keys.append(p.get_pinyin(k, "_").replace("-", "_"))
                values.append(v)
        keysname = ", ".join(keys)
        valuesdata = ", ".join(["'" + v + "'" for v in values])
        sql = f"""INSERT INTO 'wulizhandian' 
        ({keysname}) 
        VALUES 
        ({valuesdata}) """
        print(sql)
        with mysql.cursor() as cursor:
            cursor.execute(sql)
        mysql.commit()

        break


if __name__ == "__main__":
    importdata()

