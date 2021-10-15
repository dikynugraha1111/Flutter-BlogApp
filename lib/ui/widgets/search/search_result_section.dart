import 'package:flutter/material.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import 'search_result_tile.dart';

class SearchResultSection extends StatefulWidget {
  const SearchResultSection({Key? key}) : super(key: key);

  @override
  State<SearchResultSection> createState() => _SearchResultSectionState();
}

class _SearchResultSectionState extends State<SearchResultSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hasil Pencarian: 0",
          style: blackTextFont.copyWith(
            fontWeight: bold,
          ),
        ),
        const SizedBox(height: 7),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: SearchResultTile(
                title: 'List builder',
              ),
            );
          },
        ),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text("Load more...", style: blueTextFont),
          ),
        ),
        const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 6.0,
          ),
        ),
      ],
    );
  }
}
