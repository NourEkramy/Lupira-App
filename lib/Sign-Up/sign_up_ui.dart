import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modules/text_field_module.dart';

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
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.045,vertical: MediaQuery.sizeOf(context).height*0.075),
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
                        TextFieldModule(textFieldTitle: 'Username', hintTextTitle: 'Enter username',),
                        TextFieldModule(textFieldTitle: 'Email', hintTextTitle: 'useremail@plceholder.com'),
                        TextFieldModule(textFieldTitle: 'Password', hintTextTitle: 'Enter password'),
                        TextFieldModule(textFieldTitle: 'Confirm password', hintTextTitle: 'Enter password'),
                        TextFieldModule(textFieldTitle: 'Date of birth', hintTextTitle: 'DD/MM/YYYY',suffix: Icon(Icons.calendar_today_outlined),),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                        Text(
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
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
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
                                  fontFamily: 'Regular',
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
                                  fontFamily: 'Regular',
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