import 'package:flutter/material.dart';
import 'package:untitled/Modules/settings_options_module.dart';
import 'package:untitled/Password/Change%20Password/change_password.dart';

import '../Layout/main_layout.dart';

class SettingsTabs extends StatelessWidget {
  final List<String> optionIcons = [
    'assets/images/man 2.png',
    'assets/images/password-lock 1.png',
    'assets/images/language 1.png',
    'assets/images/Icon.png',
    'assets/images/Icon (1).png'
  ];

  final List<String> optionTexts = [
    'Profile',
    'Change password',
    'Language',
    'Delete account',
    'Log out'
  ];

  final List<Color> optionTextColors = [
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFFD6101D),
  ];

  SettingsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    List<VoidCallback> optionActions = [
      () {},
      () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 250),
            pageBuilder: (context, animation, secondaryAnimation) => MainLayout(
              title: 'Change Password',
              child: ChangePassword(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // from right
              const end = Offset.zero;
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: begin,
                    end: end,
                  ).chain(
                    CurveTween(curve: Curves.ease),
                  ),
                ),
                child: child,
              );
            },
          ),
        );
      },
      () {},
      () {},
      () {},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 50,
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return SettingsOptionsModule(
            optionAction: optionActions[index],
            optionTextColor: optionTextColors[index],
            optionIcon: optionIcons[index],
            optionText: optionTexts[index],
          );
        },
        itemCount: 5,
      ),
    );
  }
}
