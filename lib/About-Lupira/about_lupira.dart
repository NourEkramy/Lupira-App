import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BaseScreen/Tabs/diagnosis_tab.dart';

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
                  'assets/images/f6808b79-670d-43d6-ba35-b4dcc91c1060-removebg-preview 1.png'),
              Text(
                'Lupira',
                style: TextStyle(
                  fontSize: 55,
                  fontFamily: 'BerkshireSwash',
                  color: Color(0xFF502371),
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                "aboutLupiraParagraph".tr(),
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF817F82),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
