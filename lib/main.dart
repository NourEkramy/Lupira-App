import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'BaseScreen/base_screen.dart';
import 'BaseScreen/base_screen_logic.dart';
import 'Detection-History/detection_history.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<BaseScreenCubit>(
          create: (context) => BaseScreenCubit(),
        ),
        // Add other providers if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: BaseScreen.routeName,
        routes: {
          BaseScreen.routeName: (context) => BaseScreen(),
          DetectionHistory.routeName: (context) => DetectionHistory(),
        },
      ),
    );
  }
}