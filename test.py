import requests
import pprint

person = {
    "first_name": "123",
    "last_name": "123",
    "middle_name": "123",
    "suffix": "123",
    "nickname": "123",
    "title": "123",
    "about": "123",
    "id": 1,
    "slug": "sdfdsf",
    "phone_number": [{"phone_number": "12312313123"}],
}
data = {"name": "123", "nickname": "123", "about": "123", "persons": [person]}
print(data)
import json

headers = {"Content-Type": "application/json"}
# r = requests.post(
#     "http://127.0.0.1:8000/user/company/", data=json.dumps(data), headers=headers
# )
# print(r.url)
# print(r)

# print(r.json())

r = requests.post(
    "http://127.0.0.1:8000/user/person/", data=json.dumps(person), headers=headers
)
print(r)

pprint.pprint(r.json())
