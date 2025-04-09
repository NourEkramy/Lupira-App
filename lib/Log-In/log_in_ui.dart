import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Log-In/log_in_api.dart';
import 'package:untitled/Modules/authentication_button_module.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  static const String routName = "LogIn";

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void logIn() async{
    String email= emailController.text;
    String password = passwordController.text;
    bool success = await LogInApi.logInUser(email: email, password: password);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Log in successful")),
      );
      // Navigate or clear form if needed
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Log in failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserCredentialsCardModule(
        cardBody: Column(
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
                    TextFieldModule(
                      textController: emailController,
                      textFieldType: TextInputType.text,
                      hintTextTitle: 'Enter email',
                      textFieldTitle: 'Email',
                      hintTextColor: Color(0xFFABABAB),
                      titelTextColor: Color(0xFF817F82),
                      borderColor: Color(0xFFDEDAE0),
                      backgroundColor: Color(0xFFDEDAE0),
                    ),
                    TextFieldModule(
                      textController: passwordController,
                      textFieldType: TextInputType.visiblePassword,
                      obscureText: true,
                      hintTextTitle: 'Enter password',
                      textFieldTitle: 'Password',
                      hintTextColor: Color(0xFFABABAB),
                      titelTextColor: Color(0xFF817F82),
                      borderColor: Color(0xFFDEDAE0),
                      backgroundColor: Color(0xFFDEDAE0),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    Container(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          text: 'Forgot Password?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF502371),
                            fontFamily: 'Inder',
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
                    OperationButtonModule(
                        borderColor: Color(0xFF502371),
                        buttonColor: Color(0xFF502371),
                        buttonText: 'Login',
                        buttonTextColor: Colors.white,
                        onTap: logIn,
                    ),
                    AuthenticationButtonModule(
                        conditionOperation: 'Sign Up',
                        conditionQeustion: "Don't have an account?  "),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
