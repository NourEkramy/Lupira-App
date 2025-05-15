import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';

class DetectionCardModule extends StatelessWidget {
  String mainTitle;
  String? subtitle;
  VoidCallback? onTap;

  DetectionCardModule({
    super.key,
    required this.mainTitle,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(5.w),
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
                          horizontal: 6.w,
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
                          fontSize: 17,
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
        Positioned(
          top: -1.1.h,
          right: -3.6.w,
          child: Image.asset("assets/images/detection image.png"),
        ),
      ],
    );
  }
}
