import 'dart:convert';
import 'package:http/http.dart' as http;

class ChangePasswordApi {
  static const String Url =
      'https://lupira.onrender.com/api/auth/password';

  static Future<Map<String, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
    required String token,
  }) async {
    final uri = Uri.parse(Url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = jsonEncode({
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    });

    final response = await http.patch(
      uri,
      headers: headers,
      body: body,
    );

    final decoded = jsonDecode(response.body);

    if (response.statusCode == 200) {
      try {
        return {
          'success': true,
          'message': decoded['message'] ?? 'Password updated successfully',
        };
      } catch (e) {
        throw FormatException("Invalid JSON format: ${response.body}");
      }
    } else {
      return {
        'success': false,
        'message': decoded['error'] ?? 'Old password is incorrect',
      };
    }
  }
}