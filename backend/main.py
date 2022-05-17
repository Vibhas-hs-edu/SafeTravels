from cloud_functions.client.get_notice import get_notice
from cloud_functions.client.get_sub_advisories import get_sub_advisories
from cloud_functions.client.get_entry_requirements import get_entry_requirements
from cloud_functions.client.get_place import get_place
import json

'''response = get_notice("Canada")
print(response.text)

response = get_sub_advisories("Canada")
sub_advisories = json.loads(response.text)
print(sub_advisories)

response = get_entry_requirements("United States")
entry_requirements = json.loads(response.text)
print(entry_requirements)

response = get_place()
print(response)
'''

import requests

api_key = "AIzaSyDhLiZ1e1FFUpwuI-FjhdteBEZ7Ns-BVdw"
url = f"https://maps.googleapis.com/maps/api/place/textsearch/json?query=tourist&region=IN&key={api_key}"

payload={}
headers = {}

response = requests.request("GET", url, headers=headers, data=payload)


'''https://maps.googleapis.com/maps/api/place/photo
  ?maxwidth=400
  &photo_reference=Aap_uEA7vb0DDYVJWEaX3O-AtYp77AaswQKSGtDaimt3gt7QCNpdjp1BkdM6acJ96xTec3tsV_ZJNL_JP-lqsVxydG3nh739RE_hepOOL05tfJh2_ranjMadb3VoBYFvF0ma6S24qZ6QJUuV6sSRrhCskSBP5C1myCzsebztMfGvm7ij3gZT
  &key=YOUR_API_KEY'''

obj = json.loads(response.text)

results = obj["results"]
for r in results:
    print(r["name"])
    print(r["place_id"])
    if "photos" in r:
        print(r["photos"][0]["photo_reference"])