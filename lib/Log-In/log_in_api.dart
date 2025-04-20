import 'package:http/http.dart' as http;
import 'dart:convert';

class LogInApi{
  static Future<Map<String, dynamic>> logInUser({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse("https://lupira.onrender.com/api/auth/login");

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "email": email,
      "password": password,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    final decoded = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        return {
          'success': true,
          'message': decoded['message'] ?? 'Login successful',
        };
      } catch (e) {
        throw FormatException("Invalid JSON format: ${response.body}");
      }
    } else {
      return {
        'success': false,
        'message': decoded['error'] ?? 'Login failed',
      };
    }
  }
}