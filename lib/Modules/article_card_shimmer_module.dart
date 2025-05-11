import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ArticleCardShimmerModule extends StatelessWidget {
  const ArticleCardShimmerModule({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.3;
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFD2CFD3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image shimmer
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: double.infinity,
                height: height,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          // Website name shimmer
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 14,
                width: 100,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5),
          // Article name shimmer
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
        ],
      ),
    );
  }
}
