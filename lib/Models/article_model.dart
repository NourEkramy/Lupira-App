class ArticleModel {
  String? title;
  String? link;
  String? website;
  String? image;
  String? publishedDate;

  ArticleModel({
    this.title,
    this.link,
    this.website,
    this.image,
    this.publishedDate,
  });

  // Convert JSON to Model
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"] ?? "No title",
      link: json["link"] ?? "",
      website: json["displayLink"] ?? "Unknown source",
      image: json["pagemap"]?["cse_image"]?[0]?["src"] ?? "",
      publishedDate: json["pagemap"]?["metatags"]?[0]?["article:published_time"] ?? "Unknown date",
    );
  }

  //  Add this method to parse multiple articles from JSON
  static List<ArticleModel> fromJsonList(Map<String, dynamic> json) {
    List<dynamic> items = json["items"] ?? [];
    return items.map((item) => ArticleModel.fromJson(item)).toList();
  }
}
