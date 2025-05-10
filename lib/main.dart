import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BaseScreen/base_screen.dart';
import 'BaseScreen/base_screen_logic.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BaseScreenCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
