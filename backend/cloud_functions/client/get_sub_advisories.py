import requests
import cloud_functions.client.constants as constants
import cloud_functions.common as common

def get_sub_advisories(country):
    base_url = constants.BASE_CLOUD_URL
    function_name = "get-sub-advisories"
    try:
        resp =  requests.get(f"{base_url}/{function_name}", params = {"country" : country})
        if resp.status_code != 200:
            common.log_error(resp.reason)
            return None
    except Exception as e:
        common.log_error(e)
        return None
    return resp