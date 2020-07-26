import pyexcel
from xpinyin import Pinyin
import re
import glob
import unicodedata
import pprint

p = Pinyin()


def HandleDataToSql(table, path):
    # print(path)
    sql = """create table %s(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,"""
    infos = pyexcel.get_dict(file_name=path, name_columns_by_row=0)
    maxlength = {}
    for k, v in infos.items():
        maxlength[k] = len(max(v[4:], key=len))

    allowempty = {}
    for k, v in infos.items():
        allowempty[k] = all([len(v) > 0 for v in v[4:]])
    # pprint.pprint(allowempty)

    inttype = {}
    floatype = {}
    for k, v in infos.items():
        try:
            vs = [int(v) for v in v[4:] if len(v) > 0]
            if vs:
                inttype[k] = True
        except:
            pass

        if k not in inttype:
            try:
                vs = [float(v) for v in v[4:] if len(v) > 0]
                if vs:
                    floatype[k] = True
            except:
                pass

    records = iter(pyexcel.get_records(file_name=path))
    name = list(next(records).items())
    require = list(next(records).items())
    _ = next(records)
    fieldtype = list(next(records).items())

    tableinfo = []
    for i, _ in enumerate(name):
        if i == 0:
            continue
        info = {}
        info["cname"] = name[i][0]
        cname = unicodedata.normalize("NFKD", name[i][0])
        cname = re.sub(r"\([^\)]*\)", "", cname)
        cname = cname.strip()
        cname = cname.replace("-", "_")
        info["name"] = p.get_pinyin(cname, "_")

        info["require"] = name[i][1]
        info["ftype"] = fieldtype[i][1]
        tableinfo.append(info)

    slist = []
    for v in tableinfo:
        s = []
        # if "关联" in v["ftype"]:
        #     s.append("foreign key")
        s.append(v["name"])
        if "字符" in v["ftype"] or "文件" in v["ftype"]:
            l = maxlength[v["cname"]] * 2
            if l == 0:
                l = 32
            s.append("VARCHAR(%s)" % l)
        elif "枚举" in v["ftype"]:
            es = v["ftype"].replace("/", "")
            if v["cname"] in inttype:
                s.append("INT")
            elif v["cname"] in floatype:
                s.append("FLOAT")
            else:
                s.append("VARCHAR(32)")
        else:
            if v["cname"] == "备注":
                s.append("VARCHAR(256)")
            else:
                s.append("VARCHAR(32)")

        if "必填" in v["require"] and allowempty[v["cname"]]:
            s.append("not null")

        if "唯一" in v["require"]:
            s.append("UNIQUE")

        slist.append(" ".join(s))

    sql = sql % table
    sql = sql + "\n" + ",\n    ".join(slist) + ");\n"
    print(sql)


if __name__ == "__main__":
    for v in glob.glob("*.xlsx"):
        name = v.split("_")[0]
        pname = p.get_pinyin(name, "")
        pname = "jt_" + pname
        HandleDataToSql(pname, v)
        # break
    print("finish")
