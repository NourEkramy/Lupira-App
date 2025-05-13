import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/BaseScreen/base_screen.dart';
import 'package:untitled/Log-In/log_in_api.dart';
import 'package:untitled/Modules/authentication_button_module.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import 'package:untitled/Password/Forgot%20Password/forgot_password.dart';
import 'package:untitled/Sign-Up/sign_up_ui.dart';

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
                const begin = Offset(1.0, 0.0); // from right
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inder',
                ),
              ),
              backgroundColor: Color(0xFFB9433E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inder',
              ),
            ),
            backgroundColor: Color(0xFFB9433E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
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
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                Text(
                  "login".tr(),
                  style: TextStyle(
                    fontSize: 55,
                    fontFamily: 'Alegreya',
                    color: Color(0xFF49146D),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.005),
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
                          hintTextColor: Color(0xFFABABAB),
                          titelTextColor: Color(0xFF817F82),
                          borderColor: Color(0xFFDEDAE0),
                          backgroundColor: Color(0xFFDEDAE0),
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
                          hintTextColor: Color(0xFFABABAB),
                          titelTextColor: Color(0xFF817F82),
                          borderColor: Color(0xFFDEDAE0),
                          backgroundColor: Color(0xFFDEDAE0),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01),
                        Container(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                              text: "forgotPasswordLink".tr(),
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF502371),
                                fontFamily: 'Inder',
                                decoration: TextDecoration.underline,
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
                                        const begin =
                                            Offset(1.0, 0.0); // from right
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
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.045),
                        OperationButtonModule(
                          borderColor: Color(0xFF502371),
                          buttonColor: Color(0xFF502371),
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
                                  const begin = Offset(1.0, 0.0); // from right
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
                          conditionQeustion: "noAccount".tr(),
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
