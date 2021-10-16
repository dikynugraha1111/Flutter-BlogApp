import 'package:flutter_blog_app/model/search_model.dart';
import 'package:flutter_blog_app/shared/constant.dart';
import 'package:http/http.dart' as http;

class SearchService {
  static Future<List<SearchModel>> search(
      {http.Client? client,
      String context = "view",
      String? page = "1",
      String? perPage = "3",
      String? search = ""}) async {
    String endpoint = "/wp-json/wp/v2/search";

    client ??= http.Client();

    var queryParams = {
      'context': context,
      'page': page,
      'per_page': perPage,
      'search': search,
    };
    var uri = Uri.https(baseUrlFormatted, endpoint, queryParams);
    var response = await client.get(uri);

    return searchModelFromMap(response.body);
  }
}
