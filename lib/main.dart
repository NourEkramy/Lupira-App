import 'package:flutter/material.dart';
import 'package:untitled/Lupus%20Articles/lupus_articles.dart';

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
      initialRoute: LupusArticles.routName,
      routes: {
        BaseScreen.routeName: (context) => BaseScreen(),
        LupusArticles.routName: (context) => LupusArticles(),
      },
    );
  }
}
