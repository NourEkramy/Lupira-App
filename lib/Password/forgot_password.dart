import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import '../Log-In/log_in_ui.dart';
import 'forgot_password_api.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const String routName = "ForgotPassword";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormBuilderState>();
  var codeState;
  late String message;

  void forgotPassword() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      String email = values['Email'];

      try {
        final response = await ForgotPasswordApi.forgotPassword(
          email: email,
        );

        message = response['message'];
        var code = response['code'];

        if (code == 200)
          setState(() {
            codeState = 200;
          });
        else if (code == 404) {
          setState(() {
            codeState = 404;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inder',
                ),
              ),
              backgroundColor: Color(0xFFB9433E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              duration: Duration(seconds: 5),
            ),
          );
        } else
          setState(() {
            codeState = 500;
          });
      }catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "$e",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inder',
              ),
            ),
            backgroundColor: Color(0xFFB9433E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            duration: Duration(seconds: 5),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserCredentialsCardModule(
        cardBody: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
              Text(
                (codeState == 200 || codeState == 500)
                    ? 'Verification email'
                    : 'Forgot password?',
                style: TextStyle(
                  fontSize: 43,
                  fontFamily: 'Alegreya',
                  color: Color(0xFF49146D),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
              Text(
                (codeState == 200 || codeState == 500)
                    ? message
                    : 'Enter your Email account to reset password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inder',
                  color:
                      codeState == 500 ? Color(0xFFB9433E) : Color(0xFF817F82),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
              Image.asset(
                'assets/images/image.png', // Replace with your image path
                height: MediaQuery.sizeOf(context).height * 0.27,
                width: MediaQuery.sizeOf(context).width * 0.58,
                fit: BoxFit.fill, // Adjust the fit as needed
              ),
              FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldModule(
                      name: 'Email',
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'Email is required'),
                        FormBuilderValidators.email(
                            errorText: 'Please enter a valid email address!'),
                      ],
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
                      buttonText: (codeState == 200 || codeState == 500)
                          ? 'Resend email'
                          : 'Send verification email',
                      buttonTextColor: Colors.white,
                      onTap: forgotPassword,
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                    OperationButtonModule(
                      borderColor: Color(0xFF502371),
                      buttonColor: Color(0xFFEBE4E4),
                      buttonText: 'Back to login',
                      buttonTextColor: Color(0xFF502371),
                      onTap: () {Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 250),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                              LogIn(),
                          transitionsBuilder: (context, animation,
                              secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0); // from right
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
                      );},
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
