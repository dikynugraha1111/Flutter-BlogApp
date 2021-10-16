import 'package:flutter_blog_app/model/login_service.dart';
import 'package:flutter_blog_app/shared/constant.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<LoginModel> login(
      {http.Client? client,
      required String username,
      required String password}) async {
    String url = "${baseUrl}jwt-auth/v1/token";

    client ??= http.Client();

    var response = await client.post(Uri.parse(url),
        body: <String, String>{"username": username, "password": password});

    return LoginModel.fromJson(response.body);
  }
}
