import 'package:flutter/material.dart';
import 'package:flutter_blog_app/model/post_model.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    var post = ModalRoute.of(context)?.settings.arguments as PostModel?;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    child: const Icon(Icons.arrow_back_rounded, size: 24.0),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    width: 222,
                    child: Text(
                      post!.title!.rendered!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: blackTextFont,
                    ),
                  ),
                  SvgPicture.asset('assets/vector/ic_love_filled.svg')
                ],
              ),
            ),
            Expanded(
              child: WebView(
                initialUrl: post.link,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
