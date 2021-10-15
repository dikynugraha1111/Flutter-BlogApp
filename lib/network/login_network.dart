import 'package:flutter_blog_app/model/req_res_login_model.dart';
import 'package:http/http.dart';

class LoginClient {
  static Future<LoginApiModel> loginCheck(
      {required String email, required String password}) async {
    Response _response = await post(
      Uri.parse("https://gits-msib.my.id/wp-json/jwt-auth/v1/token"),
      body: <String, String>{"username": email, "password": password},
    );

    return LoginApiModel.fromJson(_response.body);
  }
}
