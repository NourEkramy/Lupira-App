import 'package:flutter/material.dart';
import 'package:untitled/Modules/settings_options_module.dart';

class SettingsTabs extends StatelessWidget {

  List<String> optionIcon = [
    'assets/images/man 2.png',
    'assets/images/password-lock 1.png',
    'assets/images/language 1.png',
    'assets/images/Icon.png',
    'assets/images/Icon (1).png'
  ];

  List<String> optionText = [
    'Profile',
    'Change password',
    'Language',
    'Delete account',
    'Log out'
  ];

  List<Color> optionTextColor = [
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFFD6101D),
  ];

  SettingsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 50,
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return SettingsOptionsModule(
              optionTextColor: optionTextColor[index],
              optionIcon: optionIcon[index],
              optionText: optionText[index]);
        },
        itemCount: 5,
      ),
    );
  }
}
