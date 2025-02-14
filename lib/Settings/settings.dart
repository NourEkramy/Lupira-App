import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  static const String routName = "Settings";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Color(0xFF744199),
          title: Text(
            'Settigns',
            style: TextStyle(fontSize:40,fontFamily: 'Alegreya',color: Color(0xFFEBE4E4),),
          ),
        ),
        Container(color: Color(0xFFDEDAE0),
          child: Expanded(
          child:SingleChildScrollView(
            child:  Column(
            children: [
          Column(
            children:[ElevatedButton(
              onPressed: () {
                // Add your sign-up logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDEDAE0),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFFDEDAE0), width: 2,),
                  borderRadius: BorderRadius.circular(0),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Color(0xFF4B4A4C),
                  fontFamily: 'Inder',
                  fontSize: 24,
                ),
              ),
            ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-up logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDEDAE0),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFDEDAE0), width: 2,),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Change password',
                  style: TextStyle(
                    color: Color(0xFF4B4A4C),
                    fontFamily: 'Inder',
                    fontSize: 24,
                  ),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-up logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDEDAE0),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFDEDAE0), width: 2,),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Language',
                  style: TextStyle(
                    color: Color(0xFF4B4A4C),
                    fontFamily: 'Inder',
                    fontSize: 24,
                  ),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-up logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDEDAE0),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFDEDAE0), width: 2,),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Delete account',
                  style: TextStyle(
                    color: Color(0xFF4B4A4C),
                    fontFamily: 'Inder',
                    fontSize: 24,
                  ),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-up logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDEDAE0),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFDEDAE0), width: 2,),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Color(0xFFD6101D),
                    fontFamily: 'Inder',
                    fontSize: 24,
                  ),
                ),
              ),
              Divider(),
            ]

          ),
        ]
            ),
        ),
        ),),
      ],
    );
  }
}
