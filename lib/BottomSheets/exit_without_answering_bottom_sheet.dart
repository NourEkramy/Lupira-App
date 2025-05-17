import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import '../../Formating/colors_format.dart';

class ExitWithoutAnsweringBottomSheet extends StatelessWidget {
  ExitWithoutAnsweringBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 3.6.w),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsFormat.credentialsCardColor,
          borderRadius: BorderRadius.circular(4.4.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
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
              child: Text(
                textAlign: TextAlign.center,
                'confirmExit'.tr(),
                style: TextStyleFormat.bottomSheetTitle
                    .copyWith(color: ColorsFormat.darckPruble),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.5.w),
              child: Column(
                children: [
                  Text(
                    'exitQuestion'.tr(),
                    style: TextStyleFormat.passwordSubTitle
                        .copyWith(color: ColorsFormat.text_dividerColor),
                  ),
                  SizedBox(height: 5.h),
                  OperationButtonModule(
                    borderColor: ColorsFormat.button_linksColor,
                    buttonColor: ColorsFormat.button_linksColor,
                    buttonText: 'cancel'.tr(),
                    buttonTextColor: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 2.5.h),
                  OperationButtonModule(
                    borderColor: ColorsFormat.lightRedError,
                    buttonColor: ColorsFormat.credentialsCardColor,
                    buttonText: 'confirmExit'.tr(),
                    buttonTextColor: ColorsFormat.lightRedError,
                    onTap: () {
                    },
                  ),
                  SizedBox(height: 1.5.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
