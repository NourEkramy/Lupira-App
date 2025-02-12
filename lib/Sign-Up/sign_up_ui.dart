import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routName = "SignUp";

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
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Alegreya',
                    color: Color(0xFF49146D),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                                
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Username',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintStyle: TextStyle(fontFamily: 'Inder'),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintStyle: TextStyle(fontFamily: 'Inder'),
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
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintStyle: TextStyle(fontFamily: 'Inder'),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintStyle: TextStyle(fontFamily: 'Inder'),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        const Text(
                          'Date of birth',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            suffix: Icon(Icons.calendar_today_outlined,
                                color: Color(0xFF57585D)),
                            hintStyle: TextStyle(fontFamily: 'Inder'),
                            hintText: 'DD/MM/YYYY',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        const Text(
                          'Gender',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Gender',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintStyle: TextStyle(fontFamily: 'Inder'),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                          items: <String>['Male', 'Female'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        const Text(
                          'Country',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Choose Country',
                            hintStyle: TextStyle(fontFamily: 'Inder'),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                          items: <String>['Egypt', 'Canada', 'UK'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        const Text(
                          'Ethnicity',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Select Ethnicity',
                            hintStyle: TextStyle(fontFamily: 'Inder'),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                          items: <String>['Asian or Pacific Islander', 'Black or African American', 'Hispanic or Latino', 'Native American or Alaskan Native', 'white or Caucasian', 'Multiracial or Biracial', 'A race/ethnicity not listed here'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        const Text(
                          'Phone',
                          style: TextStyle(
                            fontFamily: 'Inder',
                            fontSize: 16,
                            color: Color(0xFF57585D),
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter phone number',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintStyle: TextStyle(fontFamily: 'Inder'),
                            filled: true,
                            fillColor: Color(0xFFDEDAE0),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
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
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Inder',
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                        Center(
                          child: RichText(text: TextSpan(text: 'Already have an account? ',
                            style: TextStyle(fontSize: 15,color: Color(0xFF817F82),),
                            children: [
                              TextSpan(text: 'LogIn',
                                style: TextStyle(fontSize: 15,color: Color(0xFF502371),
                                decoration: TextDecoration.underline,
                                  fontFamily: 'Inder'
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