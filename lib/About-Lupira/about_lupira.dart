import 'package:flutter/material.dart';

class AboutLupira extends StatelessWidget {
  AboutLupira({super.key});

  static const String routName = "AboutLupira";

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
              'About',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Alegreya',
                color: Color(0xFFEBE4E4),
              ),
            ),
            Text(
              ' Lupira',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'BerkshireSwash',
                color: Color(0xFFEBE4E4),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/f6808b79-670d-43d6-ba35-b4dcc91c1060-removebg-preview 1.png'),
            Text('Lupira',style: TextStyle(fontSize: 55, fontFamily: 'BerkshireSwash',color: Color(0xFF502371),),),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
            Text("""Lupira is a medical mobile application designed to assist in the early detection of lupus, an autoimmune disease that causes widespread inflammation and damage to various body systems. By analyzing real-life scenarios and using an AI-powered model trained on symptoms and lab results, Lupira provides users with a reliable diagnosis tool.
              Additionally, the app educates users about lupus, its symptoms, and its impact, empowering individuals with knowledge to better manage their health.""",
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF817F82),
            ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      );
  }
}
