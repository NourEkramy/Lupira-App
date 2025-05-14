import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:uni_links3/uni_links.dart';
import 'package:untitled/About-Lupira/about_lupira.dart';
import 'package:untitled/BaseScreen/base_screen.dart';
import 'package:untitled/Log-In/auth_service.dart';
import 'package:untitled/Log-In/log_in_ui.dart';
import 'package:untitled/Password/Change%20Password/change_password.dart';
import 'package:untitled/Password/Reset%20Password/reset_password.dart';
import 'BaseScreen/base_screen_logic.dart';
import 'Password/Forgot Password/forgot_password.dart';
import 'Profile/profile.dart';
import 'Sign-Up/sign_up_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedLangCode = prefs.getString('selected_language') ??
      PlatformDispatcher.instance.locale.languageCode;
  final initialLocale = Locale(savedLangCode);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: initialLocale,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    initDeepLink();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = await AuthService.isTokenValid();
    if (!isLoggedIn) {
      // Token is expired or not found, log the user out
      await AuthService.logout();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LogIn(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BaseScreen(),
          ));
    }
  }

  void initDeepLink() async {
    // Handle cold start
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) handleLink(initialLink);
    } catch (e) {
      _showError('Failed to process the initial link.');
    }

    // Handle opened while app is running
    _sub = linkStream.listen((String? link) {
      if (link != null) handleLink(link);
    }, onError: (err) {
      _showError('Failed to listen for deep links.');
    });
  }

  void handleLink(String link) {
    try {
      final uri = Uri.parse(link);

      if (uri.scheme == 'lupira' && uri.host == 'reset-password') {
        final segments = uri.pathSegments;

        if (segments.isNotEmpty) {
          final token = segments.first;

          _navigatorKey.currentState?.pushNamed(
            '/reset-password',
            arguments: token,
          );
        } else {
          _showError('Reset link is missing the token.');
        }
      } else {
        _showError('Invalid reset link format.');
      }
    } catch (e) {
      _showError('Failed to process the reset link.');
    }
  }

  void _showError(String message) {
    showDialog(
      context: _navigatorKey.currentContext!,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(_navigatorKey.currentContext!),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BaseScreenCubit>(
          create: (context) => BaseScreenCubit(),
        ),
      ],
      child: Sizer(
        builder: (BuildContext , Orientation , ScreenType ) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: LogIn.routName,
            routes: {
              LogIn.routName: (context) => LogIn(),
              '/reset-password': (context) {
                final token = ModalRoute.of(context)?.settings.arguments as String;
                return ResetPassword(token: token);
              },
              ForgotPassword.routName: (context) => ForgotPassword(),
              SignUp.routName: (context) => SignUp(),
              BaseScreen.routName: (context) => BaseScreen(),
              AboutLupira.routName: (context) => AboutLupira(),
              ChangePassword.routName: (context) => ChangePassword(),
              Profile.routName: (context) => Profile(),
            },
          );
        },
      ),
    );
  }
}
