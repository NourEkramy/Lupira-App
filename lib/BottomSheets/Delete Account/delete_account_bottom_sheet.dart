import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BottomSheets/Delete%20Account/delete_account_api.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Sign-Up/sign_up_ui.dart';
import '../../Formating/colors_format.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  final String token;

  DeleteAccountBottomSheet({super.key, required this.token});

  Future<void> _deleteAccount(BuildContext context) async {
    bool success = await DeleteAccountApi.deleteAccount(token);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'accountDeletedSuccess'.tr(),
            style:
                TextStyleFormat.snackBarMessage.copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.8.w),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 2.h,
          ),
          duration: Duration(seconds: 5),
        ),
      );

      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) => SignUp(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.25.w, 0.0); // from right
            const end = Offset.zero;
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: begin,
                  end: end,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'accountDeleteError'.tr(),
            style:
                TextStyleFormat.snackBarMessage.copyWith(color: Colors.white),
          ),
          backgroundColor: ColorsFormat.darckRedError,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.8.w),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 2.h,
          ),
          duration: Duration(seconds: 5),
        ),
      );
      Navigator.pop(context);
    }
  }

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
                'deleteAccount'.tr(),
                style: TextStyleFormat.bottomSheetTitle
                    .copyWith(color: ColorsFormat.darckPruble),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.5.w),
              child: Column(
                children: [
                  Text(
                    'deleteQuestion'.tr(),
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
                    buttonText: 'deleteAccount'.tr(),
                    buttonTextColor: ColorsFormat.lightRedError,
                    onTap: () {
                      _deleteAccount(context);
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
