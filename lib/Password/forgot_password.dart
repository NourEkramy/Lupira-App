import 'package:flutter/material.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import 'forgot_password_api.dart';

bool emailSentFlag = false;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const String routName = "ForgotPassword";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  void forgotPassword() async {
    String email = emailController.text;
    String userToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwMjAsImlhdCI6MTc0NDE5MjQ2MSwiZXhwIjoxNzQ0Nzk3MjYxfQ.ggIwy6pFWSEkowZs9dnKGWuYez08qKC-uFOJ9QB5hHQ";
    bool success = await ForgotPasswordApi.forgotPassword(
      email: email,
      token: userToken,
    );

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email sent successful")),
      );

      setState(() {
        emailSentFlag = true;
      });

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send email")),
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
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
            Text(emailSentFlag ? 'Verification email': 'Forgot password?',
              style: TextStyle(
                fontSize: 43,
                fontFamily: 'Alegreya',
                color: Color(0xFF49146D),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
            Text(
              emailSentFlag ? 'We’ve sent a verification link to your email': 'Enter your Email account to reset password',
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
              height: MediaQuery.sizeOf(context).height * 0.27,
              width: MediaQuery.sizeOf(context).width * 0.58,
              fit: BoxFit.fill, // Adjust the fit as needed
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldModule(
                      textController: emailController,
                      textFieldType: TextInputType.emailAddress,
                      hintTextTitle: 'Enter Email',
                      textFieldTitle: 'Email',
                      hintTextColor: Color(0xFFABABAB),
                      titelTextColor: Color(0xFF817F82),
                      borderColor: Color(0xFFDEDAE0),
                      backgroundColor: Color(0xFFDEDAE0),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
                    OperationButtonModule(
                      borderColor: Color(0xFF502371),
                      buttonColor: Color(0xFF502371),
                      buttonText: emailSentFlag ? 'Resend email': 'Send verification email',
                      buttonTextColor: Colors.white,
                      onTap: forgotPassword,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                    OperationButtonModule(
                      borderColor: Color(0xFF502371),
                      buttonColor: Color(0xFFEBE4E4),
                      buttonText: 'Back to login',
                      buttonTextColor: Color(0xFF502371),
                      onTap: () {},
                    ),
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
