import 'package:flutter/material.dart';
import 'package:untitled/BaseScreen/base_screen.dart';
import 'package:untitled/Change%20Password/change_password.dart';

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
      initialRoute: ChangePassword.routName,
      routes: {
        BaseScreen.routeName: (context) => BaseScreen(),
        ChangePassword.routName: (context) => ChangePassword(),
      },
    );
  }
}