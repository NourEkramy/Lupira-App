import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPasswordApi{
  static Future<bool> forgotPassword({
    required String email,
    required String token,
  }) async {
    Uri url = Uri.parse("https://lupira.onrender.com/api/auth/password/forgot");

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final body = jsonEncode({
      "email": email,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Successful: ${response.body}');
      return true;
    } else {
      print(" failed: ${response.body}");
      return false;
    }
  }
}