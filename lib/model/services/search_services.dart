import 'package:http/http.dart' as http;

class SearchService {
  final String authorityUrl = "gits-msib.my.id";
  final String endpointUrl = "/wp-json/wp/v2/search";

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
      final uri = Uri.https(authorityUrl, endpointUrl, queryParams);
      response = await http.get(uri);
    } catch (_) {
      print("Something went wrong.");
    }
    return response;
  }
}
