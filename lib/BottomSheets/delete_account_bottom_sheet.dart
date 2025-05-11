import 'package:flutter/material.dart';
import 'package:untitled/BottomSheets/delete_account_api.dart';
import 'package:untitled/Modules/operation_button_module.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  Future<void> _deleteAccount(BuildContext context) async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI1MjAsImlhdCI6MTc0NTI2MjY3MSwiZXhwIjoxNzQ1MjY2MjcxfQ.EUeJ_kPUdwuhcZ25W8LHIttBSKfRVENcoeTwSNyQgaw";

    bool success = await DeleteAccountApi.deleteAccount(token);

    if (success) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account deleted successfully.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete account.')),
      );
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
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                  OperationButtonModule(
                    borderColor: Color(0xFF502371),
                    buttonColor: Color(0xFF502371),
                    buttonText: 'Cancel',
                    buttonTextColor: Color(0xFFFFFFFF),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                  OperationButtonModule(
                    borderColor: Color(0xFFD6101D),
                    buttonColor: Color(0xFFEBE4E4),
                    buttonText: 'Delete account',
                    buttonTextColor: Color(0xFFD6101D),
                    onTap: () {
                      _deleteAccount(context);
                    },
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