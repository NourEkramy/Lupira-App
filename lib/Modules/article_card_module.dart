import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';

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
          color: ColorsFormat.articleCardColor,
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
                    return Center(
                        child: Image.asset('assets/images/no_image.png'));
                  },
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
              child: Text(
                websiteName,
                style: TextStyleFormat.websiteName.copyWith(
                  color: ColorsFormat.titleColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
              child: Text(
                articleName,
                style: TextStyleFormat.passwordPageSubTitle.copyWith(
                  color: ColorsFormat.text_dividerColor,
                  fontWeight: FontWeight.bold,
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
