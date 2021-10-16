import 'package:flutter/material.dart';
import 'package:flutter_blog_app/shared/background.dart';
import 'package:flutter_blog_app/shared/theme.dart';

class MainPostWidget extends StatelessWidget {
  final String? title;
  const MainPostWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomLeft, children: [
      Container(
        width: 352,
        height: 166,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            color: const Color(0xFF000000),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: NetworkImage(Background.randomBackground()),
              fit: BoxFit.cover,
            )),
        child: null,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 29, 40),
        child: Text(
          title!,
          style: whiteTextFont.copyWith(fontWeight: bold, fontSize: 20),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ]);
  }
}
