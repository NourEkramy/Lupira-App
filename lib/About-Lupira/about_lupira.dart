import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';

class AboutLupira extends StatelessWidget {
  AboutLupira({super.key});

  static const String routName = "AboutLupira";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.8.w),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                  'assets/images/Splash Icon.png'),
              Text(
                'Lupira',
                style: TextStyle(
                  fontSize: 55,
                  fontFamily: 'BerkshireSwash',
                  color: ColorsFormat.button_linksColor,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                "aboutLupiraParagraph".tr(),
                style: TextStyleFormat.notFountText
                    .copyWith(color: ColorsFormat.titleColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
