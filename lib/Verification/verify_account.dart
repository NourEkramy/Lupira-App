import 'dart:convert';
import 'package:http/http.dart' as http;

class VerifyAccount {
  static Future<Map<String, dynamic>> verifyAccount(String token) async {
    final url = Uri.parse('https://lupira.onrender.com/api/auth/verify-email');
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('${response.body}');
    }
  }
}
