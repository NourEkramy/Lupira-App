import 'package:flutter/material.dart';

class ArticleCardModule extends StatelessWidget {
  String websiteName, articleName, articleDate, articleImage;
  VoidCallback redirectFunction;

  ArticleCardModule(
      {super.key,
      required this.articleDate,
      required this.articleImage,
      required this.articleName,
      required this.websiteName,
      required this.redirectFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: redirectFunction,
      child: Container(
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
                child: Image.network(
                  articleImage,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.3,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Text('Image failed to load');
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
              ),
              child: Text(
                websiteName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inder',
                  color: Color(0xFF817F82),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 4.0,
              ),
              child: Text(
                articleName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inder',
                  color: Color(0xFF4B4A4C),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
              ),
              child: Text(
                articleDate,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Inder',
                  color: Color(0xFF817F82),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          ],
        ),
      ),
    );
  }
}
