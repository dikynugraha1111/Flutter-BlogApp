import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() => startSplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/vector/ic_title.svg',
            width: 150,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'powered by',
              style: blackTextFont.copyWith(fontWeight: semiBold, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Image.asset(
                'assets/bitmap/logo.png',
                width: 30,
              ),
            )
          ],
        ),
      ],
    ));
  }

  startSplashScreen() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    });
  }
}
