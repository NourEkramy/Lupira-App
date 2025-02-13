import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  static const String routName = "ResetPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserCredentialsCardModule(cardBody: Column(
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
                  TextFieldModule(hintTextTitle: 'Enter new passwword', textFieldTitle: 'New password'),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.009),
                  TextFieldModule(hintTextTitle: 'Enter password', textFieldTitle: 'Confirm password'),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
                  OperationButtonModule(borderColor: Color(0xFF502371), buttonColor: Color(0xFF502371), buttonText: 'Reset password', buttonTextColor: Colors.white),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                ],
              ),
            ),
          ),
        ],
      ),),
    );
  }
}