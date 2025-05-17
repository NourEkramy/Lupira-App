import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import 'package:untitled/Password/Change%20Password/change_password.dart';
import '../../BaseScreen/Layout/main_layout.dart';
import '../../Formating/colors_format.dart';
import '../../Log-In/log_in_ui.dart';
import 'forgot_password_api.dart';

class ForgotPassword extends StatefulWidget {
  bool isChangingPassword;

  ForgotPassword({Key? key, this.isChangingPassword = false}) : super(key: key);

  static const String routName = "ForgotPassword";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormBuilderState>();
  var codeState;
  late String message;

  void forgotPassword() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      String email = values['Email'];

      try {
        final response = await ForgotPasswordApi.forgotPassword(
          email: email,
        );

        message = response['message'];
        var code = response['code'];

        if (code == 200)
          setState(() {
            codeState = 200;
          });
        else if (code == 404) {
          setState(() {
            codeState = 404;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: TextStyleFormat.snackBarMessage
                    .copyWith(color: Colors.white),
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
        } else
          setState(() {
            codeState = 500;
          });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "$e",
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == 'ar';
    return Scaffold(
      body: UserCredentialsCardModule(
        cardBody: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 6.h),
              Text(
                (codeState == 200 || codeState == 500)
                    ? 'verfEmail'.tr()
                    : 'forgotPasswordLink'.tr(),
                style: TextStyleFormat.passwordPageTitle
                    .copyWith(color: ColorsFormat.pageTitlePurble,fontSize: isArabic ? 40 : null,),
              ),
              SizedBox(height: 0.3.h),
              Text(
                (codeState == 200 || codeState == 500)
                    ? "passwordReset".tr()
                    : 'enterResetEmail'.tr(),
                textAlign: TextAlign.center,
                style: TextStyleFormat.passwordPageSubTitle.copyWith(
                  color: codeState == 500
                      ? ColorsFormat.darckRedError
                      : ColorsFormat.titleColor,
                ),
              ),
              SizedBox(height: 0.3.h),
              Image.asset(
                'assets/images/image.png', // Replace with your image path
                height: 27.h,
                width: 58.w,
                fit: BoxFit.fill, // Adjust the fit as needed
              ),
              FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldModule(
                      name: 'Email',
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'emailRequired'.tr()),
                        FormBuilderValidators.email(
                            errorText: 'emailValidRequired'.tr()),
                      ],
                      textFieldType: TextInputType.emailAddress,
                      hintTextTitle: 'enterEmail'.tr(),
                      textFieldTitle: 'email'.tr(),
                      hintTextColor: ColorsFormat.hintColor,
                      titelTextColor: ColorsFormat.titleColor,
                      borderColor: ColorsFormat.border_backgroundWhiteColor,
                      backgroundColor: ColorsFormat.border_backgroundWhiteColor,
                    ),
                    SizedBox(height: 4.5.h),
                    OperationButtonModule(
                      borderColor: ColorsFormat.button_linksColor,
                      buttonColor: ColorsFormat.button_linksColor,
                      buttonText: (codeState == 200 || codeState == 500)
                          ? 'resendEmail'.tr()
                          : 'sendVerificatoin'.tr(),
                      buttonTextColor: Colors.white,
                      onTap: forgotPassword,
                    ),
                    SizedBox(height: 2.5.h),
                    OperationButtonModule(
                      borderColor: ColorsFormat.button_linksColor,
                      buttonColor: ColorsFormat.credentialsCardColor,
                      buttonText: widget.isChangingPassword
                          ? 'back'.tr()
                          : 'backLogin'.tr(),
                      buttonTextColor: ColorsFormat.button_linksColor,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 250),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    widget.isChangingPassword
                                        ? MainLayout(
                                            title: 'changePassword'.tr(),
                                            child: ChangePassword(),
                                            showBottomNav: false,
                                          )
                                        : LogIn(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                        );
                      },
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
