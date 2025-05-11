import 'package:flutter/material.dart';
import 'package:untitled/Modules/article_card_module.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/article_model.dart';
import '../Modules/article_card_shimmer_module.dart';
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
            var articles = snapshot.data ?? [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: articles.length, // Number of shimmer placeholders
                itemBuilder: (context, index) {
                  return ArticleCardShimmerModule();
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: Color(0xffDDBCC3),
                      child: ImageIcon(
                        AssetImage("assets/images/error.png"),
                        color: Color(0xffD6101D),
                        size: 95,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Error loading articles!",
                        style: TextStyle(
                            fontFamily: "Inder",
                            fontSize: 22,
                            color: Color(0xffD6101D)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: Text(
                    "No articles found",
                    style: TextStyle(
                      color: Color(0xFF4B4A4C),
                      fontFamily: 'Inder',
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  var article = articles[index];
                  return Column(
                    children: [
                      ArticleCardModule(
                        articleImage: article.image ?? "assets/images/no_image.png",
                        articleName: article.title ?? "No title",
                        websiteName: article.website ?? "Unknown source",
                        redirectFunction: () {
                          if (article.link != null) {
                            launchUrl(Uri.parse(article.link!));
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      )
                    ],
                  );
                },
                itemCount: articles.length,
              );
            }
          },
        ),
      ),
    );
  }
}
