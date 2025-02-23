import 'package:flutter/material.dart';

import 'BaseScreen/base_screen.dart';
import 'Password/forgot_password.dart';

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
      initialRoute: ForgotPassword.routName,
      routes: {
        ForgotPassword.routName: (context) => ForgotPassword(),
      },
    );
  }
}
