import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modules/authentication_button_module.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  static const String routName = "LogIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0xFF744199),Color(0xFFEBE4E4)],
        ),
        ),

        child: Container(
          decoration: BoxDecoration(color: Color(0xFFEBE4E4),border:Border.all(color: Colors.transparent,width: 1,), borderRadius: BorderRadius.circular(10),),
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.07,vertical: MediaQuery.sizeOf(context).height*0.075),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                Text(
                  'Log In',
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

                        TextFieldModule(hintTextTitle: 'Enter email', textFieldTitle: 'Email'),
                        TextFieldModule(hintTextTitle: 'Enter password', textFieldTitle: 'Password'),
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
            ),
          ),
        ),
      ),
    );
  }
}