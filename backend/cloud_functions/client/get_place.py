import requests


def get_place():
    api_key = "AIzaSyDhLiZ1e1FFUpwuI-FjhdteBEZ7Ns-BVdw"
    country = "india"
    url = f"https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=top%20tourist%20places%20in%20{country}&inputtype=textquery&fields=review%2Crating%2Cformatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry&key={api_key}"

    payload={}
    headers = {}

    response = requests.request("GET", url, headers=headers, data=payload)

    print(response.text)

    return response