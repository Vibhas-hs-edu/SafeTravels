import requests

def get_images(country):
    base_url = "https://www.vecteezy.com/free-photos"
    final_url = f"{base_url}/{country}"
    try:
        resp =  requests.get(final_url)
        if resp.status_code != 200:
            print(resp.reason)
            return None
    except Exception as e:
        print(e)
        return None
    return resp

country = "Australia"
images = get_images(country = country)

print(images)

