import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';

class AuthenticationButtonModule extends StatelessWidget {
  final String conditionQuestion;
  final String conditionOperation;
  final VoidCallback onTap;

  AuthenticationButtonModule({
    super.key,
    required this.conditionOperation,
    required this.conditionQuestion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.h),
        Center(
          child: RichText(
            text: TextSpan(
              text: conditionQuestion,
              style: TextStyleFormat.snackBarMessage.copyWith(
                fontSize: 15.5.sp,
                color: ColorsFormat.titleColor,
              ),
              children: [
                TextSpan(
                  text: conditionOperation,
                  style: TextStyleFormat.snackBarMessage.copyWith(
                    fontSize: 15.5.sp,
                    color: ColorsFormat.button_linksColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTap,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Text(
                'or'.tr(),
                style: TextStyleFormat.snackBarMessage
                    .copyWith(color: ColorsFormat.titleColor),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsFormat.border_backgroundWhiteColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 4.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.6.w),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/google_logo 1.png'),
              SizedBox(
                width: 2.6.w,
              ),
              Text(
                'googleAuth'.tr(),
                style: TextStyleFormat.textFieldStyle
                    .copyWith(color: ColorsFormat.titleColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.5.h),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsFormat.border_backgroundWhiteColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 4.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.6.w),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/facebook_logo 1.png'),
              SizedBox(
                width: 2.4.w,
              ),
              Text(
                'facebookAuth'.tr(),
                style: TextStyleFormat.textFieldStyle
                    .copyWith(color: ColorsFormat.titleColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.5.h),
      ],
    );
  }
}
