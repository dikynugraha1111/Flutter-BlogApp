import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blog_app/model/post_model.dart';
import 'package:flutter_blog_app/network/search_network.dart';
import '../../../shared/app_route.dart';
import '../../../shared/background.dart';
import '../../../shared/theme.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);
  final String title;
  final int id;

  dynamic getPost() async {
    dynamic response = await SearchNetwork().getPostDetail(id: id);
    PostModel post = PostModel.fromMap(jsonDecode(response.body));
    return post;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(19.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: greyColor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              Background.randomBackground(),
              fit: BoxFit.cover,
              width: 85,
              height: 57,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextFont,
                ),
                const SizedBox(height: 6),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                  ),
                  // TODO: URL Launcher
                  onPressed: () async {
                    Navigator.pushNamed(
                      context,
                      AppRoute.detailRoute,
                      arguments: await getPost(),
                    );
                  },
                  child: Text(
                    "Baca Selengkapnya >>",
                    style: blueTextFont,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
