import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BaseScreen/base_screen.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Log-In/log_in_api.dart';
import 'package:untitled/Modules/authentication_button_module.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import 'package:untitled/Password/Forgot%20Password/forgot_password.dart';
import 'package:untitled/Sign-Up/sign_up_ui.dart';
import '../Formating/colors_format.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  static const String routName = "LogIn";

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormBuilderState>();

  void logIn() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      String email = values['Email'];

      try {
        final response = await LogInApi.logInUser(
          email: email,
          password: values['Password'],
        );

        bool success = response['success'];
        String message = response['message'];

        if (success) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', response['data']['token']);
          await prefs.setString(
              'username', response['data']['user']['username']);
          await prefs.setString('email', email);
          await prefs.setString('loginTime', DateTime.now().toIso8601String());

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 250),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  BaseScreen(),
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
          );
        } else {
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
        }
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: UserCredentialsCardModule(
          cardBody: FormBuilder(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 4.h),
                Text(
                  "login".tr(),
                  style: TextStyleFormat.pageTitle.copyWith(
                    color: ColorsFormat.pageTitlePurble,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFieldModule(
                          name: "email".tr(),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "emailRequired".tr()),
                            FormBuilderValidators.email(
                                errorText: "emailValidRequired".tr()),
                          ],
                          textFieldType: TextInputType.text,
                          hintTextTitle: "enterEmail".tr(),
                          textFieldTitle: "email".tr(),
                          hintTextColor: ColorsFormat.hintColor,
                          titelTextColor: ColorsFormat.titleColor,
                          borderColor: ColorsFormat.border_backgroundWhiteColor,
                          backgroundColor:
                              ColorsFormat.border_backgroundWhiteColor,
                        ),
                        TextFieldModule(
                          name: "password".tr(),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "passwordRequired".tr()),
                          ],
                          textFieldType: TextInputType.visiblePassword,
                          obscureText: true,
                          hintTextTitle: "enterPassword".tr(),
                          textFieldTitle: "password".tr(),
                          hintTextColor: ColorsFormat.hintColor,
                          titelTextColor: ColorsFormat.titleColor,
                          borderColor: ColorsFormat.border_backgroundWhiteColor,
                          backgroundColor:
                              ColorsFormat.border_backgroundWhiteColor,
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                              text: "forgotPasswordLink".tr(),
                              style: TextStyleFormat.textFieldStyle.copyWith(
                                decoration: TextDecoration.underline,
                                color: ColorsFormat.button_linksColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 250),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          ForgotPassword(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin =
                                            Offset(0.25.w, 0.0); // from right
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
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 4.5.h),
                        OperationButtonModule(
                          borderColor: ColorsFormat.button_linksColor,
                          buttonColor: ColorsFormat.button_linksColor,
                          buttonText: "login".tr(),
                          buttonTextColor: Colors.white,
                          onTap: logIn,
                        ),
                        AuthenticationButtonModule(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 250),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        SignUp(),
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
                          conditionOperation: "signup".tr(),
                          conditionQuestion: "noAccount".tr(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
