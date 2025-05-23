import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryApi {
  static Future<dynamic> fetchHistory(String token, String language) async {
    final url = Uri.parse(
        'https://lupira.onrender.com/api/diagnosis/history?lang=$language');

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
        throw Exception("failedFetchHistory".tr() + "${response.statusCode}");
      }
    } catch (e) {
      throw Exception("failedFetchHistory".tr() + "${e}");
    }
  }

  static Future<bool> deleteOneHistoryReport(
      String token, String id, String language) async {
    final url = Uri.parse(
        'https://lupira.onrender.com/api/diagnosis/history/$id?lang=$language');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.delete(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  static Future<bool> deleteAllHistory(
      String token, String language) async {
    final url = Uri.parse(
        'https://lupira.onrender.com/api/diagnosis/history?lang=$language');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.delete(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}
