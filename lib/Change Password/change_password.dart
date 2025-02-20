import 'package:flutter/material.dart';
import 'package:untitled/Modules/operation_button_module.dart';

class ChangePassword extends StatelessWidget {
  static const String routName = "ChangePassword";

  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDAE0),
      appBar: AppBar(
        backgroundColor: Color(0xFF744199),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Change password',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Alegreya',
                color: Color(0xFFEBE4E4),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
              Text(
                'The password must be different than before',
                style: TextStyle(
                  color: Color(0xFF4B4A4C),
                  fontSize: 24,
                  fontFamily: 'Inder',
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              Text(
                'Old password',
                style: TextStyle(
                  fontFamily: 'Inder',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4A4C),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter old password',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(
                    fontFamily: 'Inder',
                    color: Color(0xFF817F82),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Color(0xFFDEDAE0),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              Text(
                'New password',
                style: TextStyle(
                  fontFamily: 'Inder',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4A4C),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter new password',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(
                    fontFamily: 'Inder',
                    color: Color(0xFF817F82),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Color(0xFFDEDAE0),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              Text(
                'Confirm password',
                style: TextStyle(
                  fontFamily: 'Inder',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4A4C),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(
                    fontFamily: 'Inder',
                    color: Color(0xFF817F82),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Color(0xFFDEDAE0),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
              OperationButtonModule(
                borderColor: Color(0xFF502371),
                buttonColor: Color(0xFF502371),
                buttonText: 'Change password',
                buttonTextColor: Color(0xFFFFFFFF),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              OperationButtonModule(
                borderColor: Color(0xFF502371),
                buttonColor: Color(0xFFDEDAE0),
                buttonText: 'Forgot password',
                buttonTextColor: Color(0xFF502371),
              )
            ],
          ),
        ),
      ),
    );
  }
}
