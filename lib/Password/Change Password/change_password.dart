import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Password/Forgot%20Password/forgot_password.dart';

import 'change_password_api.dart';

class ChangePassword extends StatefulWidget {
  static const String routName = "ChangePassword";

  static List<Map<String, dynamic>> textfields = [
    {
      'validators': [
        FormBuilderValidators.required(errorText: 'oldPaswwordRequired'.tr())
      ],
      'name': 'oldPassword',
      'title': 'oldPassword'.tr(),
      'hint': 'enterOldPassword'.tr(),
    },
    {
      'name': 'newPassword',
      'title': 'newPassword'.tr(),
      'hint': 'enterNewPassword'.tr(),
      'validators': [
        FormBuilderValidators.required(errorText: 'oldPasswordRequired'.tr()),
        FormBuilderValidators.minLength(8,
            errorText: 'passwordValidLength'.tr()),
        FormBuilderValidators.match(
          RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$'),
          errorText:
              'passwordRules'.tr(),
        ),
      ],
    },
    {
      'name': 'confirmNewPassword',
      'title': 'confirmPassword'.tr(),
      'hint': 'enterPassword'.tr(),
    },
  ];

  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> changePassword() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      try {
        final prefs = await SharedPreferences.getInstance();
        var token = prefs.getString('token');

        final response = await ChangePasswordApi.changePassword(
          token: token!,
          confirmPassword: values['confirmNewPassword'],
          newPassword: values['newPassword'],
          oldPassword: values['oldPassword'],
        );

        bool success = response['success'];
        String message = response['message'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: success ? Colors.green : Color(0xFFB9433E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            duration: Duration(seconds: 3),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$e"),
            backgroundColor: Color(0xFFB9433E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
              Text(
                'diffPassword'.tr(),
                style: TextStyle(
                  color: Color(0xFF4B4A4C),
                  fontSize: 24,
                  fontFamily: 'Inder',
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var textField = ChangePassword.textfields[index];
                  final customValidator =
                      textField['name'] == 'confirmNewPassword'
                          ? [
                              (val) {
                                final password = _formKey
                                    .currentState?.fields['newPassword']?.value;
                                if (val == null || val.isEmpty)
                                  return 'confirmPasswordRequired'.tr();
                                if (val != password)
                                  return 'noMatchPassword'.tr();
                                return null;
                              }
                            ]
                          : textField['validators'];

                  return TextFieldModule(
                    obscureText: true,
                    name: textField['name'],
                    validators: customValidator,
                    textFieldTitle: textField['title'],
                    hintTextTitle: textField['hint'],
                    hintTextColor: Color(0xFF817F82),
                    titelTextColor: Color(0xFF4B4A4C),
                    borderColor: Color(0xFFABABAB),
                    backgroundColor: Colors.transparent,
                    textFieldType: TextInputType.visiblePassword,
                  );
                },
                itemCount: 3,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
              OperationButtonModule(
                borderColor: Color(0xFF502371),
                buttonColor: Color(0xFF502371),
                buttonText: 'changePassword'.tr(),
                buttonTextColor: Color(0xFFFFFFFF),
                onTap: changePassword,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              OperationButtonModule(
                borderColor: Color(0xFF502371),
                buttonColor: Color(0xFFDEDAE0),
                buttonText: 'forgotPassword'.tr(),
                buttonTextColor: Color(0xFF502371),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 250),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ForgotPassword(
                        isChangingPassword: true,
                      ),
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
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
