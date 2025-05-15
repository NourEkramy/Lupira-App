import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BottomSheets/logout_bottom_sheet.dart';
import 'package:untitled/Modules/settings_options_module.dart';
import 'package:untitled/Password/Change%20Password/change_password.dart';
import 'package:untitled/Profile/profile.dart';
import '../../BottomSheets/Delete Account/delete_account_bottom_sheet.dart';
import '../../BottomSheets/language_bottom_sheet.dart';
import '../Layout/main_layout.dart';

class SettingsTabs extends StatefulWidget {
  SettingsTabs({super.key});

  @override
  State<SettingsTabs> createState() => _SettingsTabsState();
}

class _SettingsTabsState extends State<SettingsTabs> {
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

  void _showLanguageBottomSheet(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return LanguageBottomSheet();
        },
      );
    });
  }

  void _showDeleteAccountBottomSheet(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteAccountBottomSheet(
            token: token!,
          );
        },
      );
    });
  }

  void _logOutBottomSheet(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return LogoutBottomSheet();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<VoidCallback> optionActions = [
      () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 250),
            pageBuilder: (context, animation, secondaryAnimation) => MainLayout(
              title: 'Profile',
              showBottomNav: false,
              child: Profile(),
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
      () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 250),
            pageBuilder: (context, animation, secondaryAnimation) => MainLayout(
              title: 'changePassword'.tr(),
              showBottomNav: false,
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
      () {
        setState(() {
          _showLanguageBottomSheet(context);
        });
      },
      () {
        setState(() {
          _showDeleteAccountBottomSheet(context);
        });
      },
      () {
        setState(() {
          _logOutBottomSheet(context);
        });
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.4.w,
        vertical: 5.7.h,
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
        itemCount: optionActions.length,
      ),
    );
  }
}
