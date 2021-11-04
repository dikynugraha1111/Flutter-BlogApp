import 'package:flutter/cupertino.dart';
import 'package:flutter_blog_app/model/req_res_login_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/network/login_network.dart';
import 'package:http/http.dart' as http;

class LoginTestMock extends Mock implements LoginClient {}

class MockPost extends Mock with http.Client {}

void main() {
  http.Client client = MockPost();
  LoginClient loginClient = LoginClient();
  LoginApiModel loginApiModel = LoginApiModel();
  test("Check URL", () {
    expect(loginClient.url,
        equals("https://gits-msib.my.id/wp-json/jwt-auth/v1/token"));
  });
  test("Check Token", () {
    expect(loginApiModel.token, isNull);
  });
  test(
    "Test Get Data",
    () async {
      String userName = "dikynugraha1111";
      String password = "jakarta551100";
      when(
        client.post(
          Uri.parse(
            "https://gits-msib.my.id/wp-json/jwt-auth/v1/token",
          ),
          body: <String, String>{
            "username": userName,
            "password": password,
          },
        ),
      ).thenAnswer((_) async {
        return Future.value(
          http.Response(
            '''{
        "user_email": "dikynugraha1111@gmail.com"
      }''',
            200,
          ),
        );
      });

      LoginApiModel loginClient = await LoginClient.loginCheck(
        email: userName,
        password: password,
      );
      expect(
        loginClient,
        equals(
          LoginApiModel(userEmail: "dikynugraha1111@gmail.com"),
        ),
      );
    },
  );
}
