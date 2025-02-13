import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const String routName = "ForgotPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserCredentialsCardModule(cardBody: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
          Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 43,
              fontFamily: 'Alegreya',
              color: Color(0xFF49146D),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
          Text(
            'Enter your Email account to reset password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Inder',
              color: Color(0xFF817F82),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
          Image.asset(
            'assets/images/image.png', // Replace with your image path
            height: MediaQuery.sizeOf(context).height*0.27,
            width: MediaQuery.sizeOf(context).width*0.58,
            fit: BoxFit.fill, // Adjust the fit as needed
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldModule(hintTextTitle: 'Enter Email', textFieldTitle: 'Email'),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
                  OperationButtonModule(borderColor: Color(0xFF502371), buttonColor: Color(0xFF502371), buttonText: 'Send verification email', buttonTextColor: Colors.white),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                  OperationButtonModule(borderColor: Color(0xFF502371), buttonColor: Color(0xFFEBE4E4), buttonText: 'Back to login', buttonTextColor: Color(0xFF502371)),
                ],
              ),
            ),
          ),
        ],
      ),),
    );
  }
}