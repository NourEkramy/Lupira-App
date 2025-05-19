import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../Formating/colors_format.dart';

class ExplanationBottomSheet extends StatelessWidget {
  final String explanation;

  ExplanationBottomSheet({
    super.key,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsFormat.credentialsCardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.4.w),
          topRight: Radius.circular(4.4.w),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 1.2.h,
            ),
            decoration: BoxDecoration(
              color: ColorsFormat.border_backgroundWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.4.w),
                topRight: Radius.circular(4.4.w),
              ),
            ),
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              'explanation'.tr(),
              style: TextStyleFormat.bottomSheetTitle
                  .copyWith(color: ColorsFormat.darckPruble),
            ),
          ),
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "whatMeans".tr(),
                  style: TextStyleFormat.passwordSubTitle
                      .copyWith(color: ColorsFormat.text_dividerColor),
                ),
                SizedBox(height: 1.3.h),
                Text(
                  explanation,
                  style: TextStyleFormat.passwordPageSubTitle
                      .copyWith(color: ColorsFormat.text_dividerColor),
                ),
                SizedBox(height: 7.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
