import 'package:flutter/material.dart';

class VisibilityPassword extends ChangeNotifier {
  bool _isVisible = true;
  bool get isVisible => _isVisible;

  void changeVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
