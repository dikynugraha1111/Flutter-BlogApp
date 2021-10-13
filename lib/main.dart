import 'package:flutter/material.dart';
import 'package:flutter_blog_app/ui/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'provider/login_page_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (BuildContext context) => VisibilityPassword(),
        ),
      ],
      builder: (context, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
          },
          // home: LoginPage(),
        );
      },
    );
  }
}
