import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/shared/app_route.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import 'package:flutter_blog_app/ui/widgets/main/main_post_widget.dart';
import 'package:flutter_blog_app/ui/widgets/main/quarter_circle_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/photo.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      Navigator.pushNamed(context, AppRoute.loginRoute);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 42,
                    height: 42,
                    margin: const EdgeInsets.only(left: 24, top: 33),
                    decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            Photo.randomPhoto(),
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 31, left: 10),
                    child: Text(
                      'username',
                      style: greyTextFont.copyWith(
                          fontWeight: semiBold, fontSize: 20),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 31),
                      child: Text(
                        'Search Post',
                        style: greyTextFont.copyWith(fontSize: 15),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.searchRoute);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                        padding:
                            const EdgeInsets.only(top: 31, left: 11, right: 33),
                        child: SvgPicture.asset('assets/vector/ic_search.svg')),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.searchRoute);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 58,
              ),
              Container(
                width: 352,
                alignment: Alignment.center,
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (_, index) => const MainPostWidget(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}