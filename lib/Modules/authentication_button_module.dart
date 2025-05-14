import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthenticationButtonModule extends StatelessWidget {
  String conditionQuestion;
  String conditionOperation;
  VoidCallback onTap;

  AuthenticationButtonModule(
      {super.key,
      required this.conditionOperation,
      required this.conditionQuestion,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.h),
        Center(
          child: RichText(
            text: TextSpan(
              text: conditionQuestion,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF817F82),
                fontFamily: 'Inder',
              ),
              children: [
                TextSpan(
                  text: conditionOperation,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF502371),
                    fontFamily: 'Inder',
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
                'OR',
                style: TextStyle(
                  color: Color(0xFF817F82),
                  fontFamily: 'Inder',
                  fontSize: 16,
                ),
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
            backgroundColor: Color(0xFFDEDAE0),
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
                'Continue with Google',
                style: TextStyle(
                  color: Color(0xFF817F82),
                  fontFamily: 'Inder',
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.5.h),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFDEDAE0),
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
                'Continue with Facebook',
                style: TextStyle(
                  color: Color(0xFF817F82),
                  fontFamily: 'Inder',
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.5.h),
      ],
    );
  }
}
