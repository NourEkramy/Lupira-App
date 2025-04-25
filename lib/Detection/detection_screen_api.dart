import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/detection_questions_model.dart';

class QuestionsServices {
  static Future<List<Questions>> getQuestions(String token) async {
    Uri url = Uri.https(
      "lupira.onrender.com",
      "/api/diagnosis/questions",
    );

    try {
      http.Response response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonFormat = jsonDecode(response.body);

        detectionQuestionsModel model = detectionQuestionsModel.fromJson(jsonFormat);

        return model.questions ?? [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}