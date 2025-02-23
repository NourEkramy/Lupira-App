import 'package:flutter/material.dart';
import 'package:untitled/Password/reset_password.dart';

import 'BaseScreen/base_screen.dart';

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
        BaseScreen.routeName: (context) => BaseScreen(),
        ResetPassword.routName: (context) => ResetPassword(),
      },
    );
  }
}
