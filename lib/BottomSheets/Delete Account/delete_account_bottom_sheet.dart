import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BottomSheets/Delete%20Account/delete_account_api.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Sign-Up/sign_up_ui.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  String token;

  DeleteAccountBottomSheet({super.key, required this.token});

  Future<void> _deleteAccount(BuildContext context) async {
    bool success = await DeleteAccountApi.deleteAccount(token);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Account deleted successfuly',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inder',
            ),
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
            var begin = Offset(0.25, 0.0); // from right
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inder',
            ),
          ),
          backgroundColor: Color(0xFFB9433E),
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
          color: Color(0xFFEBE4E4),
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
                color: Color(0xFFDEDAE0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.4.w),
                  topRight: Radius.circular(4.4.w),
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                'deleteAccount'.tr(),
                style: TextStyle(
                  color: Color(0xFF3D1A57),
                  fontSize: 32,
                  fontFamily: 'Inder',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.5.w),
              child: Column(
                children: [
                  Text(
                    'deleteQuestion'.tr(),
                    style: TextStyle(
                      fontFamily: 'Inder',
                      color: Color(0xFF4B4A4C),
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 7.h),
                  OperationButtonModule(
                    borderColor: Color(0xFF502371),
                    buttonColor: Color(0xFF502371),
                    buttonText: 'cancel'.tr(),
                    buttonTextColor: Color(0xFFFFFFFF),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 2.5.h),
                  OperationButtonModule(
                    borderColor: Color(0xFFD6101D),
                    buttonColor: Color(0xFFEBE4E4),
                    buttonText: 'deleteAccount'.tr(),
                    buttonTextColor: Color(0xFFD6101D),
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
