import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modules/text_field_module.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  static const String routName = "ResetPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0xFF744199),Color(0xFFEBE4E4)],
        ),
        ),

        child: Container(
          decoration: BoxDecoration(color: Color(0xFFEBE4E4),border:Border.all(color: Colors.transparent,width: 1,), borderRadius: BorderRadius.circular(10),),
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.07,vertical: MediaQuery.sizeOf(context).height*0.075),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.098),
                Text(
                  'Reset password',
                  style: TextStyle(
                    fontSize: 43,
                    fontFamily: 'Alegreya',
                    color: Color(0xFF49146D),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
                Text(
                  'The password must be different than before',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inder',
                    color: Color(0xFF817F82),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TextFieldModule(hintTextTitle: 'Enter new passwword', textFieldTitle: 'New password'),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.009),
                        TextFieldModule(hintTextTitle: 'Enter password', textFieldTitle: 'Confirm password'),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
                        ElevatedButton(
                          onPressed: () {
                            // Add your sign-up logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF49146D),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: const Text(
                            'Reset password',
                            style: TextStyle(
                              fontFamily: 'Inder',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}