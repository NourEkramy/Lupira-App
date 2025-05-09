import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import 'package:untitled/Password/reset_password_api.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  static const String routName = "ResetPassword";

  static List<Map<String, dynamic>> textfields = [
    {
      'name': 'newPassword',
      'title': 'New password',
      'hint': 'Enter new password',
      'validators': [
        FormBuilderValidators.required(errorText: 'New password is required'),
        FormBuilderValidators.minLength(8,
            errorText: 'Password must be at least 8 characters long!'),
        FormBuilderValidators.match(
          RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$'),
          errorText:
              'Password must include at least one lowercase letter, one uppercase letter, one number, and one special character!',
        ),
      ],
    },
    {
      'name': 'confirmNewPassword',
      'title': 'Confirm password',
      'hint': 'Enter password',
    },
  ];

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> resetPassword() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      try {
        final response = await ResetPasswordApi.resetPassword(
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMwMjAsImlhdCI6MTc0NTkzODE4MywiZXhwIjoxNzQ1OTQxNzgzfQ.OhvabFu1dXGTEvS7ieMZrVWdvMyB3tFppi9WtzEUes8",
          newPassword: values['newPassword'],
          confirmPassword: values['confirmNewPassword'],
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
            content: Text("Error: $e"),
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
    return Scaffold(
      body: UserCredentialsCardModule(
        cardBody: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.098),
              Text(
                'Reset password',
                style: TextStyle(
                  fontSize: 43,
                  fontFamily: 'Alegreya',
                  color: Color(0xFF49146D),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
              Text(
                'The password must be different than before',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inder',
                  color: Color(0xFF817F82),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
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
                                          return 'Please confirm your password';
                                        if (val != password)
                                          return 'Passwords do not match';
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
                        itemCount: 2,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.04),
                      OperationButtonModule(
                          onTap: resetPassword,
                          borderColor: Color(0xFF502371),
                          buttonColor: Color(0xFF502371),
                          buttonText: 'Reset password',
                          buttonTextColor: Colors.white),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.025),
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
