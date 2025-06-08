import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BaseScreen/base_screen.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';

class DetectionResultScreen extends StatelessWidget {
  const DetectionResultScreen({super.key});

  static const String routeName = "DetectionResultScreen";

  Future<bool> goToDiagnosisTab(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => BaseScreen(),
    );
    return result == true;
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as dynamic;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;

        final shouldExit = await goToDiagnosisTab(context);

        if (context.mounted && shouldExit == true) {
          Navigator.pop(context, result);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(2.4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            data['code'] == 1
                ? CircleAvatar(
                    radius: 10.3.h,
                    backgroundColor: Color(0xffDDBCC3),
                    child: ImageIcon(
                      AssetImage("assets/images/remove_11294539.png"),
                      color: ColorsFormat.lightRedError,
                      size: 48.sp,
                    ),
                  )
                : CircleAvatar(
                    radius: 10.3.h,
                    backgroundColor: Color(0xffC2D0D0),
                    child: ImageIcon(
                      AssetImage("assets/images/approve_11294447.png"),
                      color: Color(0xff209872),
                      size: 48.sp,
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
      ),
    );
  }
}
