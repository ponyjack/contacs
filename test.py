import requests
import pprint

phones = [{"phone_number": "234234", "name": "123123", "slug": "12312"}]
person = {
    "first_name": "123",
    "last_name": "123",
    "middle_name": "123",
    "suffix": "123",
    "nickname": "123",
    "title": "123",
    "about": "123",
    "phones": phones,
}
data = {"name": "123", "nickname": "123", "about": "123", "persons": [phones]}
print(person)
import json

headers = {"Content-Type": "application/json"}
# r = requests.post(
#     "http://127.0.0.1:8000/user/company/", data=json.dumps(data), headers=headers
# )
# print(r.url)
# print(r)

# print(r.json())

r = requests.put(
    "http://127.0.0.1:8000/user/person/1/", data=json.dumps(person), headers=headers
)
print(r)

pprint.pprint(r.json())
