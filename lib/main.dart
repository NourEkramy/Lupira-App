import 'package:flutter/material.dart';
import 'package:untitled/Sign-Up/sign_up_ui.dart';

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
      initialRoute: SignUp.routName,
      routes: {
        BaseScreen.routeName: (context) => BaseScreen(),
        SignUp.routName: (context) => SignUp(),
      },
    );
  }
}
