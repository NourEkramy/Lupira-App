import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Log-In/auth_service.dart';
import 'package:untitled/Log-In/log_in_ui.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import '../Formating/colors_format.dart';

class LogoutBottomSheet extends StatelessWidget {
  LogoutBottomSheet({super.key});

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
                'logout'.tr(),
                style: TextStyleFormat.bottomSheetTitle
                    .copyWith(color: ColorsFormat.darckPruble),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.4.w),
              child: Column(
                children: [
                  Text(
                    'logoutQuestion'.tr(),
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
                    buttonText: 'logout'.tr(),
                    buttonTextColor: ColorsFormat.lightRedError,
                    onTap: () {
                      AuthService.logout();
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 250),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  LogIn(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
