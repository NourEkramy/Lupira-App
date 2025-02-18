import 'package:flutter/material.dart';
import 'package:untitled/Modules/detection_card_module.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 40,
          bottom: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetectionCardModule(
              mainTitle: 'Quick Detection',
              subtitle: 'Free lupus detection',
            ),
            Text(
              'Learn More',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF502371),
                fontFamily: 'Inder',
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 0, // Spread of the shadow
                    blurRadius: 8, // Softness of the shadow
                    offset: const Offset(0, 4), // Position of the shadow (X, Y)
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFD2CFD3),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Image.asset(
                      'assets/images/info_about_lupus-removebg-preview (1) 1.png'),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.065),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lupus Articles',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Color(0xFF4B4A4C),
                            fontFamily: 'Inder',
                          ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                        Text(
                          'Learn more about description, symptoms and tips of lupus',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF817F82),
                            fontFamily: 'Inder',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 0, // Spread of the shadow
                    blurRadius: 8, // Softness of the shadow
                    offset: const Offset(0, 4), // Position of the shadow (X, Y)
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFD2CFD3),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Image.asset('assets/images/about image.png'),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.065),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                          text: 'About ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Color(0xFF4B4A4C),
                            fontFamily: 'Inder',
                          ),
                          children: [
                            TextSpan(
                              text: 'Lupira',
                              style: TextStyle(
                                fontSize: 21,
                                color: Color(0xFF502371),
                                fontFamily: 'BerkshireSwash',
                              ),
                            ),
                          ],
                        ),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                        Text(
                          'Discover who we are and what we do?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF817F82),
                            fontFamily: 'Inder',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
