import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  static const String routName = "Settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDAE0),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Color(0xFF744199),
            title: Text(
              'Settigns',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Alegreya',
                color: Color(0xFFEBE4E4),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 13),
                      child: Row(
                        children: [
                          Image.asset('assets/images/man 2.png'),
                          SizedBox(width: MediaQuery.sizeOf(context).width * 0.065),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: Color(0xFF4B4A4C),
                              fontFamily: 'Inder',
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 1,color: Color(0xFFABABAB),),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
