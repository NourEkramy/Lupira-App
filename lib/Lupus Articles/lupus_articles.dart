import 'package:flutter/material.dart';

class LupusArticles extends StatelessWidget {
  static const String routName = 'LupusArticles';

  const LupusArticles({super.key});

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
              'Lupus Articles',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Alegreya',
                color: Color(0xFFEBE4E4),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 36,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD2CFD3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                          'assets/images/living with lupus 1 (1).png',
                          width: double.infinity,
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Padding(
                    padding: EdgeInsets.only(left:8.0,),
                    child: Text(
                      'helthline',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inder',
                        color: Color(0xFF817F82),
                      ),
                    ),
                  ),
                  Text(
                    'Living with Lupus',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inder',
                      color: Color(0xFF4B4A4C),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:8.0,),
                    child: Text(
                      '5 November, 2019',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inder',
                        color: Color(0xFF817F82),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
