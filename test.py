import requests
import pprint
import uuid
import json

print(uuid.uuid4())


r = requests.post(
    "http://127.0.0.1:8000/api-auth/login/",
    data={"useranem": "admin", "passowrd": "admin"},
)
print(r.json())
# phones = [{"phone_number": "999999", "name": "qqq"}]
# person = {
#     "first_name": "123",
#     "last_name": "123",
#     "middle_name": "123",
#     "suffix": "123",
#     "nickname": "123",
#     "title": "123",
#     "about": "123",
#     "phones": phones,
# }
# data = {"name": "123", "nickname": "123", "about": "123", "persons": [phones]}
# print(person)
# import json

# headers = {"Content-Type": "application/json"}
# r = requests.post(
#     "http://127.0.0.1:8000/user/company/", data=json.dumps(data), headers=headers
# )
# print(r.url)
# print(r)

# print(r.json())

# r = requests.post(
#     "http://127.0.0.1:8000/user/person/", data=json.dumps(person), headers=headers
# )
# print(r)
# pprint.pprint(r.json())

# pprint.pprint(r.json())
# phone = {"name": "!23123", "phone_number": "12312312", "person": 1}
# r = requests.delete("http://127.0.0.1:8000/user/person_phone/4/", data=phone)
# print(r)

# pprint.pprint(r.json())
