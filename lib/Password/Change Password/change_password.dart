import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Password/Forgot%20Password/forgot_password.dart';
import '../../Formating/colors_format.dart';
import 'change_password_api.dart';

class ChangePassword extends StatefulWidget {
  static const String routName = "ChangePassword";

  static List<Map<String, dynamic>> textfields = [
    {
      'validators': [
        FormBuilderValidators.required(errorText: 'oldPaswwordRequired'.tr())
      ],
      'name': 'oldPassword',
      'title': 'oldPaswword'.tr(),
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
          errorText: 'passwordRules'.tr(),
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
            backgroundColor:
                success ? Colors.green : ColorsFormat.darckRedError,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.8.w),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            duration: Duration(seconds: 3),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$e"),
            backgroundColor: ColorsFormat.darckRedError,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.8.w),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 2.h,
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
        padding: EdgeInsets.all(3.7.w),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.5.h),
              Text(
                'diffPassword'.tr(),
                style: TextStyleFormat.passwordSubTitle.copyWith(color: ColorsFormat.text_dividerColor,
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
                    hintTextColor: ColorsFormat.titleColor,
                    titelTextColor: ColorsFormat.text_dividerColor,
                    borderColor: ColorsFormat.hintColor,
                    backgroundColor: Colors.transparent,
                    textFieldType: TextInputType.visiblePassword,
                  );
                },
                itemCount: 3,
              ),
              SizedBox(height: 7.h),
              OperationButtonModule(
                borderColor: ColorsFormat.button_linksColor,
                buttonColor: ColorsFormat.button_linksColor,
                buttonText: 'changePassword'.tr(),
                buttonTextColor: Colors.white,
                onTap: changePassword,
              ),
              SizedBox(height: 3.h),
              OperationButtonModule(
                borderColor: ColorsFormat.button_linksColor,
                buttonColor: ColorsFormat.border_backgroundWhiteColor,
                buttonText: 'forgotPassword'.tr(),
                buttonTextColor: ColorsFormat.button_linksColor,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
