import 'package:flutter/material.dart';

import '../Modules/operation_button_module.dart';

class LogoutBottomSheets extends StatelessWidget {
  const LogoutBottomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEBE4E4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFDEDAE0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Log out',
                style: TextStyle(
                  color: Color(0xFF3D1A57),
                  fontSize: 32,
                  fontFamily: 'Inder',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Text(
                    'Are you sure that you want to log out of your account?',
                    style: TextStyle(
                      fontFamily: 'Inder',
                      color: Color(0xFF4B4A4C),
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                  OperationButtonModule(
                    borderColor: Color(0xFF502371),
                    buttonColor: Color(0xFF502371),
                    buttonText: 'Cancel',
                    buttonTextColor: Color(0xFFFFFFFF),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                  OperationButtonModule(
                    borderColor: Color(0xFFD6101D),
                    buttonColor: Color(0xFFEBE4E4),
                    buttonText: 'Log out',
                    buttonTextColor: Color(0xFFD6101D),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}