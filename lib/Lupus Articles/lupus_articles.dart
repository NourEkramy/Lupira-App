import 'package:flutter/material.dart';
import 'package:untitled/Modules/article_card_module.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/article_model.dart';
import 'aricles_services.dart';

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
        child: FutureBuilder<List<ArticleModel>>(
          future: ArticlesServices.getLupusArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error loading articles"));
            }

            var articles = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                var article = articles[index];
                return Column(
                  children: [
                    ArticleCardModule(
                      articleDate: article.publishedDate ?? "Unknown date",
                      articleImage: article.image ?? "",
                      articleName: article.title ?? "No title",
                      websiteName: article.website ?? "Unknown source",
                      redirectFunction: () {
                        if (article.link != null) {
                          launchUrl(Uri.parse(article.link!));
                        }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,)
                  ],
                );
              },
              itemCount: articles.length,
            );
          },
        ),
      ),
    );
  }
}
