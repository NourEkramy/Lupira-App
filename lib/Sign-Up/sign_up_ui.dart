import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modules/authentication_button_module.dart';
import 'package:untitled/Modules/operation_button_module.dart';
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
                            hintStyle: TextStyle(fontFamily: 'Inder', color: Color(0xFFABABAB),),
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
                            hintStyle: TextStyle(fontFamily: 'Inder', color: Color(0xFFABABAB)),
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
                            hintStyle: TextStyle(fontFamily: 'Inder', color: Color(0xFFABABAB),),
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
                        TextFieldModule(hintTextTitle: 'Enter phone number', textFieldTitle: 'Phone'),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                        OperationButtonModule(borderColor: Color(0xFF49146D), buttonColor: Color(0xFF49146D), buttonText: 'Sigup', buttonTextColor: Colors.white),
                        AuthenticationButtonModule(conditionOperation: 'Login', conditionQeustion: 'Already have an account?  '),
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