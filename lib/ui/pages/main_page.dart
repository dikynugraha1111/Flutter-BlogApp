import 'package:flutter/material.dart';
import 'package:flutter_blog_app/shared/app_route.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import 'package:flutter_blog_app/ui/widgets/main/quarter_circle_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Image.asset(
                    'assets/bitmap/logo.png',
                    width: 72,
                  ),
                ),
                InkWell(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      const SizedBox(
                        width: 55,
                        height: 55,
                        child: QuarterCircle(
                          circleAlignment: CircleAlignment.topRight,
                          color: greyColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(
                          'assets/vector/ic_switch_account.svg',
                          width: 30,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoute.loginRoute);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
