from cloud_functions.client.get_notice import get_notice

response = get_notice("Canada")
print(response.text)