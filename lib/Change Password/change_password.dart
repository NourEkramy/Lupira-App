import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled/Change%20Password/change_password_api.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';

class ChangePassword extends StatefulWidget {
  static const String routName = "ChangePassword";

  static List<Map<String, dynamic>> textfields = [
    {
      'validators': [
        FormBuilderValidators.required(errorText: 'Old password is required')
      ],
      'name': 'Old password',
      'title': 'Old password',
      'hint': 'Enter old password',
    },
    {
      'name': 'New password',
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
      'name': 'Confirm password',
      'title': 'Confirm password',
      'hint': 'Enter password',
    },
  ];

  ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> changePassword() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;
      print("Form Values: $values");

      try {
        final response = await ChangePasswordApi.changePassword(
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMwMjAsImlhdCI6MTc0NTUxNzE5MCwiZXhwIjoxNzQ1NTIwNzkwfQ.3e6Gdyi3XMrGdzyCspWC_mk2bRDfM7kfIEkMCtJrhHc",
          confirmPassword: values['Confirm password'],
          newPassword: values['New password'],
          oldPassword: values['Old password'],
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
      backgroundColor: Color(0xFFDEDAE0),
      appBar: AppBar(
        backgroundColor: Color(0xFF744199),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Change password',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Alegreya',
                color: Color(0xFFEBE4E4),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                Text(
                  'The password must be different than before',
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
                        textField['name'] == 'Confirm password'
                            ? [
                                (val) {
                                  final password = _formKey.currentState
                                      ?.fields['New password']?.value;
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
                  itemCount: 3,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                OperationButtonModule(
                  borderColor: Color(0xFF502371),
                  buttonColor: Color(0xFF502371),
                  buttonText: 'Change password',
                  buttonTextColor: Color(0xFFFFFFFF),
                  onTap: changePassword,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                OperationButtonModule(
                  borderColor: Color(0xFF502371),
                  buttonColor: Color(0xFFDEDAE0),
                  buttonText: 'Forgot password',
                  buttonTextColor: Color(0xFF502371),
                  onTap: () {}, // Important redirect to forget password
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}