import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
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
      'confirmNewPassword': confirmPassword,
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
          'message': decoded['message'] ?? 'passwordUpdateSuccess'.tr(),
        };
      } catch (e) {
        throw FormatException("${response.body}");
      }
    } else {
      return {
        'success': false,
        'message': decoded['error'] ?? 'passwordUpdateFailed'.tr(),
      };
    }
  }
}