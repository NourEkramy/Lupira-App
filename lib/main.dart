import 'package:flutter/material.dart';
import 'package:untitled/Log-In/log_in_ui.dart';

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
      initialRoute: LogIn.routName,
      routes: {
        LogIn.routName: (context) => LogIn(),
      },
    );
  }
}