import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isVisible = true;
  bool get isVisible => _isVisible;

  String _name = "username";
  String get name => _name;

  String _token = "token";
  String get token => _token;

  void changeVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void changeAccount(String name, String token) {
    _name = name;
    _token = token;
    notifyListeners();
  }
}
