import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';

class DetectionResultScreen extends StatelessWidget {
  const DetectionResultScreen({super.key});

  static const String routeName = "DetectionResultScreen";

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as dynamic;
    return Padding(
      padding: EdgeInsets.all(2.4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          data['code'] == 1
              ? CircleAvatar(
                  radius: 10.3.h,
                  backgroundColor: Color(0xffDDBCC3),
                  child: ImageIcon(
                    AssetImage("assets/images/warning_positive_result.png"),
                    color: ColorsFormat.lightRedError,
                    size: 100.sp,
                  ),
                )
              : CircleAvatar(
                  radius: 10.3.h,
                  backgroundColor: Color(0xffC2D0D0),
                  child: ImageIcon(
                    AssetImage("assets/images/negative_result.png"),
                    color: Color(0xff209872),
                    size: 51.sp,
                  ),
                ),
          SizedBox(
            height: 2.5.h,
          ),
          Text(
            "detectionResult".tr(),
            style: TextStyleFormat.textFieldStyle.copyWith(
              color: data['code'] == 1
                  ? ColorsFormat.lightRedError
                  : Color(0xff209872),
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.8.w),
            child: Text(
              data['result'],
              textAlign: TextAlign.center,
              style: TextStyleFormat.passwordSubTitle.copyWith(
                color: ColorsFormat.text_dividerColor,
                fontSize: 27,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          if (data['code'] == 1)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 4.8.w,
                vertical: 2.3.h,
              ),
              decoration: BoxDecoration(
                color: ColorsFormat.detectCardColor,
                borderRadius: BorderRadius.circular(3.w),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/phonendoscope.png"),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "nextStep".tr(),
                        style: TextStyleFormat.passwordSubTitle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorsFormat.darckPruble,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "recommendConsulting".tr(),
                    style: TextStyleFormat.passwordPageSubTitle.copyWith(
                      color: ColorsFormat.text_dividerColor,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
