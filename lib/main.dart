import 'package:flutter/material.dart';
import 'package:untitled/Password/forgot_password.dart';
import 'package:untitled/Log-In/log_in_ui.dart';
import 'package:untitled/Password/reset_password.dart';
import 'package:untitled/Sign-Up/sign_up_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ResetPassword.routName,
      routes: {
        SignUp.routName: (context) =>SignUp(),
        LogIn.routName: (context) => LogIn(),
        ForgotPassword.routName: (context) => ForgotPassword(),
        ResetPassword.routName: (context) => ResetPassword(),
      },
    );
  }
}