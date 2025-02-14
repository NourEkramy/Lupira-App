import 'package:flutter/material.dart';
import 'package:untitled/Settings/settings.dart';

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
      initialRoute: Settings.routName,
      routes: {
        Settings.routName: (context) => Settings(),
      },
    );
  }
}