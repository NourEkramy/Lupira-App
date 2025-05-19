import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Log-In/log_in_ui.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import 'package:untitled/Password/Reset%20Password/reset_password_api.dart';
import '../../Formating/colors_format.dart';

class ResetPassword extends StatefulWidget {
  final String token;

  ResetPassword({Key? key, required this.token}) : super(key: key);

  static const String routName = "ResetPassword";

  static List<Map<String, dynamic>> textfields = [
    {
      'name': 'newPassword',
      'title': 'newPassword'.tr(),
      'hint': 'enterNewPassword'.tr(),
      'validators': [
        FormBuilderValidators.required(errorText: 'newPasswordRequired'.tr()),
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

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> resetPassword() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      setState(() {
        isLoading = true;
      });

      try {
        final response = await ResetPasswordApi.resetPassword(
          token: widget.token,
          newPassword: values['newPassword'],
          confirmPassword: values['confirmNewPassword'],
        );

        bool success = response['success'];
        String message = response['message'];

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: TextStyleFormat.snackBarMessage
                    .copyWith(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.8.w),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              duration: Duration(seconds: 5),
            ),
          );

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 250),
              pageBuilder: (context, animation, secondaryAnimation) => LogIn(),
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
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
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
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserCredentialsCardModule(
        cardBody: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 9.8.h),
              Text(
                'resetPassword'.tr(),
                style: TextStyleFormat.passwordPageTitle
                    .copyWith(color: ColorsFormat.pageTitlePurble),
              ),
              SizedBox(height: 0.3.h),
              Text(
                'diffPassword'.tr(),
                textAlign: TextAlign.center,
                style: TextStyleFormat.passwordPageSubTitle
                    .copyWith(color: ColorsFormat.titleColor),
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var textField = ResetPassword.textfields[index];
                          final customValidator =
                              textField['name'] == 'confirmNewPassword'
                                  ? [
                                      (val) {
                                        final password = _formKey.currentState
                                            ?.fields['newPassword']?.value;
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
                        itemCount: 2,
                      ),
                      SizedBox(height: 4.h),
                      OperationButtonModule(
                        isLoading: isLoading,
                        loadingIndicator: SizedBox(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3.5.sp,
                          ),
                          height: 3.h,
                          width: 6.w,
                        ),
                        onTap: resetPassword,
                        borderColor: ColorsFormat.button_linksColor,
                        buttonColor: ColorsFormat.button_linksColor,
                        buttonText: 'resetPassword'.tr(),
                        buttonTextColor: Colors.white,
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
