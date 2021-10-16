import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isVisible = true;
  bool get isVisible => _isVisible;

  bool _isCompleted = true;
  bool get isCompleted => _isCompleted;

  String _name = "";
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

  void changeStatus() {
    _isCompleted = !_isCompleted;
    notifyListeners();
  }
}
