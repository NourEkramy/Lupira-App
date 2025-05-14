import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import 'package:untitled/Password/Change%20Password/change_password.dart';
import '../../BaseScreen/Layout/main_layout.dart';
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
        } else
          setState(() {
            codeState = 500;
          });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "$e",
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(
                  fontSize: 43,
                  fontFamily: 'Alegreya',
                  color: Color(0xFF49146D),
                ),
              ),
              SizedBox(height: 0.3.h),
              Text(
                (codeState == 200 || codeState == 500)
                    ? message
                    : 'enterResetEmail'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inder',
                  color:
                      codeState == 500 ? Color(0xFFB9433E) : Color(0xFF817F82),
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
                      hintTextColor: Color(0xFFABABAB),
                      titelTextColor: Color(0xFF817F82),
                      borderColor: Color(0xFFDEDAE0),
                      backgroundColor: Color(0xFFDEDAE0),
                    ),
                    SizedBox(height: 4.5.h),
                    OperationButtonModule(
                      borderColor: Color(0xFF502371),
                      buttonColor: Color(0xFF502371),
                      buttonText: (codeState == 200 || codeState == 500)
                          ? 'resendEmail'.tr()
                          : 'sendVerificatoin'.tr(),
                      buttonTextColor: Colors.white,
                      onTap: forgotPassword,
                    ),
                    SizedBox(height: 2.5.h),
                    OperationButtonModule(
                      borderColor: Color(0xFF502371),
                      buttonColor: Color(0xFFEBE4E4),
                      buttonText: widget.isChangingPassword
                          ? 'back'.tr()
                          : 'backLogin'.tr(),
                      buttonTextColor: Color(0xFF502371),
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
