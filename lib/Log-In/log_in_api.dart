import 'package:http/http.dart' as http;
import 'dart:convert';

class LogInApi {
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
    var decoded = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return decoded;
    } else {
      return {
        'success': false,
        'message': decoded['error'] ?? 'Unknown error',
      };
    }
  }
}
