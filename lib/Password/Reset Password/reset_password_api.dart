import 'package:http/http.dart' as http;
import 'dart:convert';

class ResetPasswordApi {
  static Future<Map<String, dynamic>> resetPassword({
    required String newPassword,
    required String confirmPassword,
    required String token,
  }) async {
    Uri url = Uri.parse("https://lupira.onrender.com/api/auth/password/reset");

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = jsonEncode({
      'newPassword': newPassword,
      'confirmNewPassword': confirmPassword,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    final decoded = jsonDecode(response.body);

    if (response.statusCode == 200) {
      try {
        return {
          'success': true,
          'message': decoded['message'] ??
              'Password reset successfully. You can now log in with your new password.',
        };
      } catch (e) {
        throw FormatException("Invalid JSON format: ${response.body}");
      }
    } else {
      return {
        'success': false,
        'message': decoded['error'] ?? "User with this email does not exist.",
      };
    }
  }
}
