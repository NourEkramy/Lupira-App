import 'package:flutter/material.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';

class ChangePassword extends StatelessWidget {
  static const String routName = "ChangePassword";

  ChangePassword({super.key});

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
              TextFieldModule(hintTextTitle: 'Enter old password', textFieldTitle: 'Old password', hintTextColor: Color(0xFF817F82), titelTextColor: Color(0xFF4B4A4C), borderColor: Color(0xFFABABAB), backgroundColor: Colors.transparent),
              TextFieldModule(hintTextTitle: 'Enter new password', textFieldTitle: 'New password', hintTextColor: Color(0xFF817F82), titelTextColor: Color(0xFF4B4A4C), borderColor: Color(0xFFABABAB), backgroundColor: Colors.transparent),
              TextFieldModule(hintTextTitle: 'Enter password', textFieldTitle: 'Confirm password', hintTextColor: Color(0xFF817F82), titelTextColor: Color(0xFF4B4A4C), borderColor: Color(0xFFABABAB), backgroundColor: Colors.transparent),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
              OperationButtonModule(
                borderColor: Color(0xFF502371),
                buttonColor: Color(0xFF502371),
                buttonText: 'Change password',
                buttonTextColor: Color(0xFFFFFFFF),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              OperationButtonModule(
                borderColor: Color(0xFF502371),
                buttonColor: Color(0xFFDEDAE0),
                buttonText: 'Forgot password',
                buttonTextColor: Color(0xFF502371),
              )
            ],
          ),
        ),
      ),
    );
  }
}
