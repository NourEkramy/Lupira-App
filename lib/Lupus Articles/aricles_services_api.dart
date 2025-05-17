import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/article_model.dart';

class ArticlesServices {
  static const String apiKey = "AIzaSyB-BNZyBvaZz4axUvlD4yhLXI1fZ3r2iR8";
  static const String cx = "078ee4e86cd144663";

  static Future<List<ArticleModel>> getLupusArticles(var language) async {
    Uri url = Uri.https(
      "www.googleapis.com",
      "/customsearch/v1",
      {
        "key": apiKey,
        "q": language=="ar" ? "الذئبةالحمراء" : "lupus",
        "cx": cx,
        "num": "10",
      },
    );
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    List<ArticleModel> articles = ArticleModel.fromJsonList(jsonFormat);
    return articles;
  }
}
