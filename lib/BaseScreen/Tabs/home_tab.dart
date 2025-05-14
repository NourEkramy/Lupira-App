import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/About-Lupira/about_lupira.dart';
import 'package:untitled/Lupus%20Articles/lupus_articles.dart';
import 'package:untitled/Modules/detection_card_module.dart';
import '../../BottomSheets/prerequisites_bottom_sheet.dart';
import '../Layout/main_layout.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 3.3.w,
          right: 3.3.w,
          top: 4.6.h,
          bottom: 3.1.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetectionCardModule(
              mainTitle: 'quickDetection'.tr(),
              subtitle: 'freeDetection'.tr(),
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
              padding: EdgeInsets.only(left: 2.w, bottom: 0.4.h),
              child: Text(
                'learnMore'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF502371),
                  fontFamily: 'Inder',
                ),
              ),
            ),
            SizedBox(height: 1.5.h),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 250),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MainLayout(
                          title: 'articles'.tr(),
                          child: LupusArticles(),
                        ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(0.25.w, 0.0); // from right
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
                      blurRadius: 2.w,
                      // Softness of the shadow
                      offset: Offset(0, 0.5.h), // Position of the shadow (X, Y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(2.6.w),
                  color: Color(0xFFD2CFD3),
                ),
                padding: EdgeInsets.symmetric(horizontal: 2.8.w, vertical: 0.9.h),
                child: Row(
                  children: [
                    Image.asset(
                        'assets/images/info_about_lupus-removebg-preview (1) 1.png'),
                    SizedBox(width: 6.5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'articles'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Color(0xFF4B4A4C),
                              fontFamily: 'Inder',
                            ),
                          ),
                          SizedBox(
                              height: 1.h),
                          Text(
                            'learnLupus'.tr(),
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
            SizedBox(height: 3.5.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 250),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MainLayout(
                      title: 'about'.tr(),
                      appName: 'Lupira',
                      child: AboutLupira(),
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(0.25.w, 0.0); // from right
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
                      blurRadius: 2.w,
                      // Softness of the shadow
                      offset:
                        Offset(0, 0.5.h), // Position of the shadow (X, Y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(2.6.w),
                  color: Color(0xFFD2CFD3),
                ),
                padding: EdgeInsets.symmetric(horizontal: 2.8.w, vertical: 0.9.h),
                child: Row(
                  children: [
                    Image.asset('assets/images/about image.png'),
                    SizedBox(width: 6.5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'about'.tr(),
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
                              height: 1.h),
                          Text(
                            'discover'.tr(),
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
