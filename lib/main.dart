import 'package:flutter/material.dart';

import 'BaseScreen/base_screen.dart';
import 'Detection-History/detection_history.dart';

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
      initialRoute: DetectionHistory.routeName,
      routes: {
        BaseScreen.routeName: (context) => BaseScreen(),
        DetectionHistory.routeName: (context) => DetectionHistory(),
      },
    );
  }
}
