import 'dart:async';
import 'dart:ui';
import 'package:app_links/app_links.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/About-Lupira/about_lupira.dart';
import 'package:untitled/BaseScreen/base_screen.dart';
import 'package:untitled/Log-In/log_in_ui.dart';
import 'package:untitled/Password/Change%20Password/change_password.dart';
import 'package:untitled/Password/Reset%20Password/reset_password.dart';
import 'BaseScreen/base_screen_logic.dart';
import 'Password/Forgot Password/forgot_password.dart';
import 'Profile/profile.dart';
import 'Sign-Up/sign_up_ui.dart';
import 'Splash/splash_screen.dart';

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
  late final AppLinks _appLinks;
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    initAppLinks();
  }

  void initAppLinks() async {
    _appLinks = AppLinks();

    try {
      // Handle the initial deep link (cold start)
      final Uri? initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        handleLink(initialUri.toString());
      }
    } catch (e) {
      _showError('failedInitialLink'.tr());
    }

    // Listen for future deep links
    _appLinks.uriLinkStream.listen(
      (Uri? uri) {
        if (uri != null) {
          handleLink(uri.toString()); // your existing logic
        }
      },
      onError: (err) {
        _showError('failedListenLink'.tr());
      },
    );
  }

  void handleLink(String link) {
    try {
      final uri = Uri.parse(link);

      if (uri.scheme == 'lupira' && uri.host == 'reset-password') {
        final token = uri.queryParameters['token'];
        if (token != null && token.isNotEmpty) {
          _navigatorKey.currentState
              ?.pushNamed('/reset-password', arguments: token);
        } else {
          _showError('resetMissingToken'.tr());
        }
      } else if (uri.scheme == 'lupira' && uri.host == 'verify-email') {
        // Optional: extract token if you want to use it
        // final token = uri.queryParameters['token'];

        // ✅ Redirect to login page
        _navigatorKey.currentState?.pushNamedAndRemoveUntil(
          LogIn.routName,
              (route) => false,
        );
      } else {
        _showError('invalidResetFormat'.tr());
      }
    } catch (e) {
      _showError('failedProccessResetLink'.tr());
    }
  }

  void _showError(String message) {
    showDialog(
      context: _navigatorKey.currentContext!,
      builder: (_) => AlertDialog(
        title: Text('error'.tr()),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(_navigatorKey.currentContext!),
            child: Text('understood'.tr()),
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
        builder: (BuildContext, Orientation, ScreenType) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routName,
            routes: {
              SplashScreen.routName: (context) => SplashScreen(),
              LogIn.routName: (context) => LogIn(),
              '/reset-password': (context) {
                final token =
                    ModalRoute.of(context)?.settings.arguments as String;
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
