import 'package:http/http.dart' as http;

class Server {
  // field
  String base_url = "https://us-central1-safetravels-349107.cloudfunctions.net";

  Future<http.Response> get_notice(String? country) async {
    String get_notice = "get-notice";
    final qParams = {'country': country};

    var uri = Uri.parse("${this.base_url}/${get_notice}");
    final finalUri = uri.replace(queryParameters: qParams);
    var response = await http.get(finalUri);
    return response;
  }

  Future<http.Response> get_entry_requirements(String? country) async {
    String get_notice = "get-entry-requirements";
    final qParams = {'country': country};

    var uri = Uri.parse("${this.base_url}/${get_notice}");
    final finalUri = uri.replace(queryParameters: qParams);
    var response = await http.get(finalUri);
    return response;
  }

  Future<http.Response> get_sub_advisories(String? country) async {
    String get_sub_advisories = "get-sub-advisories";
    final qParams = {'country': country};

    var uri = Uri.parse("${this.base_url}/${get_sub_advisories}");
    final finalUri = uri.replace(queryParameters: qParams);
    var response = await http.get(finalUri);
    return response;
  }

  Future<http.Response> get_visit_reasons(String? country) async {
    String get_sub_advisories = "get-visit-reasons";
    final qParams = {'country': country};

    var uri = Uri.parse("${this.base_url}/${get_sub_advisories}");
    final finalUri = uri.replace(queryParameters: qParams);
    var response = await http.get(finalUri);
    return response;
  }

  Future<http.Response> get_places(String? country_code) async {
    String api_key = "AIzaSyDhLiZ1e1FFUpwuI-FjhdteBEZ7Ns-BVdw";
    final qParams = {
      'query': 'tourist',
      'region': country_code,
      'key': api_key
    };

    var uri =
        Uri.parse("https://maps.googleapis.com/maps/api/place/textsearch/json");
    final finalUri = uri.replace(queryParameters: qParams);
    var response = await http.get(finalUri);
    return response;
  }

  Future<http.Response> get_air_bnb_details(String? country) async {
    String get_air_bnb_details = "get-air-bnb-details";
    final qParams = {'country': country};

    var uri = Uri.parse("${this.base_url}/${get_air_bnb_details}");
    final finalUri = uri.replace(queryParameters: qParams);
    var response = await http.get(finalUri);
    return response;
  }

  Future<http.Response> get_main_image(String? country) async {
    String get_main_image = "get-main-image";
    final qParams = {'country': country};

    var uri = Uri.parse("${this.base_url}/${get_main_image}");
    final finalUri = uri.replace(queryParameters: qParams);
    var response = await http.get(finalUri);
    return response;
  }

  Future<http.Response> get_country_images(String? country) async {
    String get_country_images = "get-country-images";
    final qParams = {'country': country};

    var uri = Uri.parse("${this.base_url}/${get_country_images}");
    final finalUri = uri.replace(queryParameters: qParams);
    var response = await http.get(finalUri);
    return response;
  }
}
