import 'package:flutter/material.dart';
import 'package:untitled/BottomSheets/Delete%20Account/delete_account_api.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Sign-Up/sign_up_ui.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  String token;

  DeleteAccountBottomSheet({super.key, required this.token});

  Future<void> _deleteAccount(BuildContext context) async {

    bool success = await DeleteAccountApi.deleteAccount(token);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Account deleted successfuly',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inder',
            ),
          ),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          duration: Duration(seconds: 5),
        ),
      );

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) => SignUp(),
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

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to delete account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inder',
            ),
          ),
          backgroundColor: Color(0xFFB9433E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          duration: Duration(seconds: 5),
        ),
      );
      Navigator.pop(context);
    }
  }

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
                'Delete account',
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
                    'Are you sure that you want to delete your account?',
                    style: TextStyle(
                      fontFamily: 'Inder',
                      color: Color(0xFF4B4A4C),
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .sizeOf(context)
                      .height * 0.07),
                  OperationButtonModule(
                    borderColor: Color(0xFF502371),
                    buttonColor: Color(0xFF502371),
                    buttonText: 'Cancel',
                    buttonTextColor: Color(0xFFFFFFFF),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: MediaQuery
                      .sizeOf(context)
                      .height * 0.025),
                  OperationButtonModule(
                    borderColor: Color(0xFFD6101D),
                    buttonColor: Color(0xFFEBE4E4),
                    buttonText: 'Delete account',
                    buttonTextColor: Color(0xFFD6101D),
                    onTap: () {
                      _deleteAccount(context);
                    },
                  ),
                  SizedBox(height: MediaQuery
                      .sizeOf(context)
                      .height * 0.015),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}