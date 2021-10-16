import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPostWidget extends StatelessWidget {
  const ShimmerPostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352,
      height: 166,
      margin: const EdgeInsets.only(bottom: 30),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
