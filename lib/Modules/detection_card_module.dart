import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'dart:math' as math;

class DetectionCardModule extends StatelessWidget {
  final String mainTitle;
  final String? subtitle;
  final VoidCallback? onTap;

  DetectionCardModule({
    super.key,
    required this.mainTitle,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == 'ar';
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 95.w,
          height: 22.4.h,
          decoration: BoxDecoration(
            color: ColorsFormat.detectCardColor,
            borderRadius: BorderRadius.circular(2.6.w),
          ),
          padding: EdgeInsets.all(isArabic ? 4.w : 5.w),
          margin: EdgeInsets.only(
            top: 0.8.h,
            right: 1.w,
            bottom: 4.6.h,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mainTitle,
                      style: TextStyleFormat.passwordSubTitle.copyWith(
                        color: ColorsFormat.darckPruble,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle != null
                        ? Text(
                            subtitle ?? "",
                            style: TextStyleFormat.snackBarMessage.copyWith(
                              color: ColorsFormat.darckPruble,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(height: 1.h),
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsFormat.detectCardColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: isArabic ? 7.3.w : 6.w,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: ColorsFormat.button_linksColor,
                            width: 0.5.w,
                          ),
                          borderRadius: BorderRadius.circular(2.6.w),
                        ),
                      ),
                      child: Text(
                        "startNow".tr(),
                        style: TextStyleFormat.textFieldStyle.copyWith(
                          fontSize: 16.sp,
                          color: ColorsFormat.button_linksColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
        isArabic
            ? Positioned(
                top: -1.1.h,
                left: -3.6.w, // moved from 'right' to 'left'
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(math.pi),
                  child: Image.asset(
                    "assets/images/detection image.png",
                    height: 25.h,
                    width: 47.w,
                  ),
                ),
              )
            : Positioned(
                top: -1.1.h,
                right: -3.6.w,
                child: Image.asset(
                  "assets/images/detection image.png",
                  width: 47.w,
                  height: 25.h,
                ),
              ),
      ],
    );
  }
}
