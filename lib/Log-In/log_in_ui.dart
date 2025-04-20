import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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

  final _formKey = GlobalKey<FormBuilderState>();

  void logIn() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      String email = values['Email'];

      try{
        final response = await LogInApi.logInUser(
          email: email,
          password: values['Password'],
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
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login error: $e"),
            backgroundColor: Color(0xFFB9433E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
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
                        name: 'Email',
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'Email is required'),
                          FormBuilderValidators.email(
                              errorText: 'Please enter a valid email address!'),
                        ],
                        textFieldType: TextInputType.text,
                        hintTextTitle: 'Enter email',
                        textFieldTitle: 'Email',
                        hintTextColor: Color(0xFFABABAB),
                        titelTextColor: Color(0xFF817F82),
                        borderColor: Color(0xFFDEDAE0),
                        backgroundColor: Color(0xFFDEDAE0),
                      ),
                      TextFieldModule(
                        name: 'Password',
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'Password is required'),
                        ],
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
      ),
    );
  }
}
