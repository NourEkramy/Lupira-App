import 'package:flutter/material.dart';
import 'package:untitled/Modules/settings_options_module.dart';

class SettingsTabs extends StatelessWidget {

  List<String> optionIcons = [
    'assets/images/man 2.png',
    'assets/images/password-lock 1.png',
    'assets/images/language 1.png',
    'assets/images/Icon.png',
    'assets/images/Icon (1).png'
  ];

  List<String> optionTexts = [
    'Profile',
    'Change password',
    'Language',
    'Delete account',
    'Log out'
  ];

  List<Color> optionTextColors = [
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFF4B4A4C),
    Color(0xFFD6101D),
  ];


  SettingsTabs({super.key});

  void profileAction() {
    print('Profile tapped');
    // Add your logic here
  }

  void changePasswordAction() {
    print('Change password tapped');
    // Add your logic here
  }

  void languageAction() {
    print('Language tapped');
    // Add your logic here
  }

  void deleteAccountAction() {
    print('Delete account tapped');
    // Add your logic here
  }

  void logOutAction() {
    print('Log out tapped');
    // Add your logic here
  }

  @override
  Widget build(BuildContext context) {
    List<VoidCallback> optionActions = [
      profileAction,
      changePasswordAction,
      languageAction,
      deleteAccountAction,
      logOutAction,
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
              optionText: optionTexts[index]);
        },
        itemCount: 5,
      ),
    );
  }
}
