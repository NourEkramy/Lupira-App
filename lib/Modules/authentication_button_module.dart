import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthenticationButtonModule extends StatelessWidget {

  String conditionQeustion;
  String conditionOperation;

  AuthenticationButtonModule({super.key, required this.conditionOperation, required this.conditionQeustion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        Center(
          child: RichText(text: TextSpan(text: conditionQeustion,
            style: TextStyle(fontSize: 15,color: Color(0xFF817F82),fontFamily: 'Inder'),
            children: [
              TextSpan(text: conditionOperation,
                style: TextStyle(fontSize: 15,color: Color(0xFF502371),
                  fontFamily: 'Inder',
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap=(){},
              ),
            ],
          )
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        Row(children: [
          Expanded(child: Divider()
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('OR',
              style: TextStyle(color: Color(0xFF817F82),
                fontFamily: 'Inder',
                fontSize: 16,
              ),),
          ),
          Expanded(child: Divider(),
          ),
        ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFDEDAE0),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: Size(double.infinity, 50),
          ),

          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/google_logo 1.png'),
              SizedBox(width: MediaQuery.sizeOf(context).width*0.026,),
              Text(
                'Continue with Google',
                style: TextStyle(
                  color: Color(0xFF817F82),
                  fontFamily: 'Inder',
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
        ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFDEDAE0),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: Size(double.infinity, 50),
          ),

          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/facebook_logo 1.png') ,
              SizedBox(width: MediaQuery.sizeOf(context).width*0.024,),
              Text(
                'Continue with Facebook',
                style: TextStyle(
                  color: Color(0xFF817F82),
                  fontFamily: 'Inder',
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.055),
      ],
    );
  }
}
