import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import '../Models/detection_questions_model.dart';

class QuestionsServices {
  static Future<List<Questions>> getQuestions(String token, String language) async {
    Uri url = Uri.https(
      "lupira.onrender.com",
      "/api/diagnosis/questions",
      {
        "lang": language,
      },
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

        detectionQuestionsModel model =
            detectionQuestionsModel.fromJson(jsonFormat);

        return model.questions ?? [];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  static Future<Map<String, dynamic>> sendAndDetect({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    Uri url = Uri.parse("https://lupira.onrender.com/api/diagnosis/detection");

    final headers = {
      "Authorization": "Bearer $token",
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('failedSubmit'.tr() + '${response.statusCode}');
    }
  }
}
