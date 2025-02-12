import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const String routName = "ForgotPassword";

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
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontSize: 43,
                    fontFamily: 'Alegreya',
                    color: Color(0xFF49146D),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
                Text(
                  'Enter your Email account to reset password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inder',
                    color: Color(0xFF817F82),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.003),
                Image.asset(
                  'assets/images/image.png', // Replace with your image path
                  height: MediaQuery.sizeOf(context).height*0.27,
                  width: MediaQuery.sizeOf(context).width*0.58,
                  fit: BoxFit.fill, // Adjust the fit as needed
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.008),
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 18,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintStyle: TextStyle(fontFamily: 'Inder',color: Color(0xFFABABAB)),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
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
                            'Send verification email',
                            style: TextStyle(
                              fontFamily: 'Inder',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFEBE4E4),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Color(0xFF502371),width: 2)
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),

                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Back to login',
                                style: TextStyle(
                                  color: Color(0xFF502371),
                                  fontFamily: 'Inder',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
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