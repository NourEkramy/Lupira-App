import 'package:flutter/material.dart';
import 'package:untitled/About-Lupira/about_lupira.dart';

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
      initialRoute: AboutLupira.routName,
      routes: {
        AboutLupira.routName: (context) => AboutLupira(),
      },
    );
  }
}
