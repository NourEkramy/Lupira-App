import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Modules/article_card_module.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Formating/colors_format.dart';
import '../Models/article_model.dart';
import '../Modules/article_card_shimmer_module.dart';
import 'aricles_services_api.dart';

class LupusArticles extends StatelessWidget {
  static const String routName = 'LupusArticles';

  const LupusArticles({super.key});

  @override
  Widget build(BuildContext context) {
    String language = context.locale.languageCode;

    return Padding(
      padding: EdgeInsets.only(
        left: 3.6.w,
        right: 3.6.w,
        top: 3.8.h,
      ),
      child: FutureBuilder<List<ArticleModel>>(
        future: ArticlesServices.getLupusArticles(language),
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
                    radius: 8.6.h,
                    backgroundColor: ColorsFormat.lupusArticlesWhite,
                    child: ImageIcon(
                      AssetImage("assets/images/error.png"),
                      color: ColorsFormat.lightRedError,
                      size: 39.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.2.w),
                    child: Text(
                      "articlesError".tr(),
                      style: TextStyleFormat.notFountText
                          .copyWith(color: ColorsFormat.lightRedError),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 1.h,
                ),
                child: Text(
                  "noArticles".tr(),
                  style: TextStyleFormat.passwordPageSubTitle
                      .copyWith(color: ColorsFormat.text_dividerColor),
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
                      articleImage:
                          article.image ?? "assets/images/no_image.png",
                      articleName: article.title ?? "No title",
                      websiteName: article.website ?? "Unknown source",
                      redirectFunction: () {
                        if (article.link != null) {
                          launchUrl(Uri.parse(article.link!));
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    )
                  ],
                );
              },
              itemCount: articles.length,
            );
          }
        },
      ),
    );
  }
}
