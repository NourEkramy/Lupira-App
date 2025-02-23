import 'package:flutter/material.dart';

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
      initialRoute: BaseScreen.routeName,
      routes: {
        BaseScreen.routeName: (context) => BaseScreen(),
      },
    );
  }
}
