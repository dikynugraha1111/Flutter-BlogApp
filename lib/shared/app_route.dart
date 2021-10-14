import 'package:flutter/material.dart';
import 'package:flutter_blog_app/ui/pages/detail_page.dart';
import 'package:flutter_blog_app/ui/pages/login_page.dart';
import 'package:flutter_blog_app/ui/pages/main_page.dart';
import 'package:flutter_blog_app/ui/pages/search_page.dart';
import 'package:flutter_blog_app/ui/pages/splash_screen_page.dart';

class AppRoute {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String searchRoute = '/search';
  static const String detailRoute = '/detail';
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splashRoute: (BuildContext context) {
      return const SplashScreenPage();
    },
    loginRoute: (BuildContext context) {
      return const LoginPage();
    },
    mainRoute: (BuildContext context) {
      return const MainPage();
    },
    searchRoute: (BuildContext context) {
      return const SearchPage();
    },
    detailRoute: (BuildContext context) {
      return const DetailPage();
    },
  };
}
