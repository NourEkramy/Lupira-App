import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryApi {
  static Future<dynamic?> fetchHistory(String token) async {
    final url = Uri.parse('https://lupira.onrender.com/api/diagnosis/history');

    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        throw Exception("Failed to fetch history data ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch history data ${e}");
    }
  }
}