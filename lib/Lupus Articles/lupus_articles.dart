import 'package:flutter/material.dart';
import 'package:untitled/Modules/article_card_module.dart';

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
            ArticleCardModule(articleDate: '5 November, 2019', articleImage: 'assets/images/living with lupus 1 (1).png', articleName: 'Living with Lupus', websiteName: 'HealthLinks', redirectFunction: (){}),
          ],
        ),
      ),
    );
  }
}
