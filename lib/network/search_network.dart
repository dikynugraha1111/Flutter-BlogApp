import 'package:http/http.dart' as http;

class SearchNetwork {
  final String authorityUrl = "gits-msib.my.id";
  final String searchEndpointUrl = "/wp-json/wp/v2/search";
  final String postEndpointUrl = "/wp-json/wp/v2/posts";

  Future<dynamic> getResponse({
    required String query,
    String page = '1',
    String perPage = '10',
  }) async {
    dynamic response;
    Map<String, dynamic> queryParams = {
      'context': 'view',
      'page': page,
      'per_page': perPage,
      'search': query,
    };
    try {
      final uri = Uri.https(authorityUrl, searchEndpointUrl, queryParams);
      response = await http.get(uri);
    } catch (_) {
      print("Something went wrong.");
    }
    return response;
  }

  Future<dynamic> getPostDetail({
    required int id,
  }) async {
    dynamic response;
    try {
      final uri = Uri.https(authorityUrl, "$postEndpointUrl/$id");
      response = await http.get(uri);
    } catch (_) {
      print("Something went wrong.");
    }
    return response;
  }
}
