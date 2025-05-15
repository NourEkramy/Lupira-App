import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/colors_format.dart';

class ArticleCardShimmerModule extends StatelessWidget {
  const ArticleCardShimmerModule({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 90.w;
    double height = 30.h;
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: ColorsFormat.shimmerCard,
        borderRadius: BorderRadius.circular(2.6.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image shimmer
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.6.w),
              topRight: Radius.circular(2.6.w),
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
          SizedBox(height: 1.h),
          // Website name shimmer
          Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 1.7.h,
                width: 25.w,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 0.6.h),
          // Article name shimmer
          Padding(
            padding: EdgeInsets.only(left: 1.1.w),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 2.5.h,
                width: 50.w,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 0.6.h),
          SizedBox(height: 1.5.h),
        ],
      ),
    );
  }
}
