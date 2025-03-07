import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modules/authentication_button_module.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  static const String routName = "LogIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserCredentialsCardModule(cardBody: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
          Text(
            'Login',
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
                  TextFieldModule(hintTextTitle: 'Enter email', textFieldTitle: 'Email', hintTextColor: Color(0xFFABABAB), titelTextColor: Color(0xFF817F82), borderColor: Color(0xFFDEDAE0), backgroundColor: Color(0xFFDEDAE0),),
                  TextFieldModule(hintTextTitle: 'Enter password', textFieldTitle: 'Password', hintTextColor: Color(0xFFABABAB), titelTextColor: Color(0xFF817F82), borderColor: Color(0xFFDEDAE0), backgroundColor: Color(0xFFDEDAE0),),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Container(
                    alignment: Alignment.centerRight,
                    child: RichText(text: TextSpan(text: 'Forgot Password?',
                      style: TextStyle(fontSize: 17,color: Color(0xFF502371),
                        fontFamily: 'Inder',
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap=(){},
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
                  OperationButtonModule(borderColor: Color(0xFF502371), buttonColor: Color(0xFF502371), buttonText: 'Login', buttonTextColor: Colors.white),
                  AuthenticationButtonModule(conditionOperation: 'Sign Up', conditionQeustion: "Don't have an account?  "),
                ],
              ),
            ),
          ),
        ],
      ),),
    );
  }
}