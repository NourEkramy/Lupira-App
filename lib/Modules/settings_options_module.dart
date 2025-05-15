import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../Formating/colors_format.dart';

class SettingsOptionsModule extends StatelessWidget {
  String optionIcon;
  String optionText;
  Color optionTextColor;
  VoidCallback optionAction;

  SettingsOptionsModule({
    super.key,
    required this.optionAction,
    required this.optionTextColor,
    required this.optionIcon,
    required this.optionText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: optionAction,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.4.w,
            vertical: 1.5.h,
          ),
          child: Row(
            children: [
              Image.asset(optionIcon),
              SizedBox(width: 6.5.w),
              Text(
                optionText,
                style: TextStyleFormat.passwordSubTitle
                    .copyWith(color: optionTextColor),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 0.3.w,
          color: ColorsFormat.hintColor,
        ),
      ]),
    );
  }
}
