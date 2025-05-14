import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ArticleCardModule extends StatelessWidget {
  String websiteName, articleName, articleImage;
  VoidCallback redirectFunction;

  ArticleCardModule(
      {super.key,
      required this.articleImage,
      required this.articleName,
      required this.websiteName,
      required this.redirectFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: redirectFunction,
      child: Container(
        width: 90.w,
        decoration: BoxDecoration(
          color: Color(0xFFD2CFD3),
          borderRadius: BorderRadius.circular(2.6.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.6.w),
                  topRight: Radius.circular(2.6.w),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.6.w),
                  topRight: Radius.circular(2.6.w),
                ),
                child: Image.network(
                  articleImage,
                  width: double.infinity,
                  height: 30.h,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Image.asset('assets/images/no_image.png'));
                  },
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(
                left: 2.w,
              ),
              child: Text(
                websiteName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inder',
                  color: Color(0xFF817F82),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 2.w,
              ),
              child: Text(
                articleName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inder',
                  color: Color(0xFF4B4A4C),
                ),
              ),
            ),
            SizedBox(height: 1.5.h),
          ],
        ),
      ),
    );
  }
}
