import 'package:flutter/material.dart';
import 'package:untitled/About-Lupira/about_lupira.dart';
import 'package:untitled/Lupus%20Articles/lupus_articles.dart';
import 'package:untitled/Modules/detection_card_module.dart';
import '../../Modules/prerequisites_bottom_sheet.dart';
import '../Layout/main_layout.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          top: 40,
          bottom: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetectionCardModule(
              mainTitle: 'Quick Detection',
              subtitle: 'Free lupus detection',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return PrerequisitesBottomSheet();
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 3),
              child: Text(
                'Learn More',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF502371),
                  fontFamily: 'Inder',
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 250),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MainLayout(
                          title: 'Lupus Articles',
                          child: LupusArticles(),
                        ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0); // from right
                      const end = Offset.zero;
                      return SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: begin,
                            end: end,
                          ).chain(
                            CurveTween(curve: Curves.ease),
                          ),
                        ),
                        child: child,
                      );
                    },
                  ),
                );

              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      // Shadow color with opacity
                      spreadRadius: 0,
                      // Spread of the shadow
                      blurRadius: 8,
                      // Softness of the shadow
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
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01),
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
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 250),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MainLayout(
                      title: 'About ',
                      appName: 'Lupira',
                      child: AboutLupira(),
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0); // from right
                      const end = Offset.zero;
                      return SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: begin,
                            end: end,
                          ).chain(
                            CurveTween(curve: Curves.ease),
                          ),
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      // Shadow color with opacity
                      spreadRadius: 0,
                      // Spread of the shadow
                      blurRadius: 8,
                      // Softness of the shadow
                      offset:
                          const Offset(0, 4), // Position of the shadow (X, Y)
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
                                    fontWeight: FontWeight.normal,
                                    fontSize: 21,
                                    color: Color(0xFF502371),
                                    fontFamily: 'BerkshireSwash',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01),
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
            ),
          ],
        ),
      ),
    );
  }
}
