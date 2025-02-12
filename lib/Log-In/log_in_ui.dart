import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  static const String routName = "LogIn";

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
                  'Log In',
                  style: TextStyle(
                    fontSize: 55,
                    fontFamily: 'Alegreya',
                    color: Color(0xFF49146D),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.005),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
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
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 18,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintStyle: TextStyle(fontFamily: 'Inder',color: Color(0xFFABABAB),),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                        Container(
                          alignment: Alignment.centerRight,
                          child: RichText(text: TextSpan(text: 'Forgot Password?',
                                style: TextStyle(fontSize: 17,color: Color(0xFF502371),
                                  fontFamily: 'Inder',
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()..onTap=(){},
                              ),
                            textAlign: TextAlign.center,
                          ),
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
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Inder',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
                        Center(
                          child: RichText(text: TextSpan(text: "Don't have an account? ",
                            style: TextStyle(fontSize: 15,color: Color(0xFF817F82),
                            fontFamily: 'Inder'),
                            children: [
                              TextSpan(text: 'Sign Up',
                                style: TextStyle(fontSize: 15,color: Color(0xFF502371),
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Inder',
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