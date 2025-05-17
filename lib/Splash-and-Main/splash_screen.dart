import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../BaseScreen/base_screen.dart';
import '../Formating/colors_format.dart';
import '../Log-In/auth_service.dart';
import '../Log-In/log_in_ui.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  static const String routName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuth();
  }

  Future<void> _navigateBasedOnAuth() async {
    await Future.delayed(
        Duration(milliseconds: 500)); // Give the UI time to render
    final isLoggedIn = await AuthService.isTokenValid();
    if (!isLoggedIn) {
      await AuthService.logout();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LogIn(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BaseScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFormat.border_backgroundWhiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 35.h),
          Image.asset(
            'assets/images/splash_image.png',
          ),
          Text(
            'Lupira',
            style: TextStyle(
              fontSize: 47,
              fontFamily: 'BerkshireSwash',
              color: ColorsFormat.button_linksColor,
            ),
          ),
          SizedBox(height: 28.h),
          Center(
            child: Text(
              'Detect lupus early\nempower your health journey',
              textAlign: TextAlign.center,
              style: TextStyleFormat.passwordSubTitle.copyWith(
                color: ColorsFormat.button_linksColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
