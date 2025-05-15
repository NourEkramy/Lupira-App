import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPasswordApi {
  static Future<Map<String, dynamic>> forgotPassword({
    required String email,
  }) async {
    Uri url = Uri.parse("https://lupira.onrender.com/api/auth/password/forgot");

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "email": email,
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
          'code': 200,
          'message': decoded['message'] ?? 'passwordResetSent'.tr(),
        };
      } catch (e) {
        throw FormatException("${response.body}");
      }
    } else {
      if (response.statusCode == 404) {
        return {
          'success': false,
          'code': 404,
          'message': decoded['error'] ?? "userExist".tr(),
        };
      } else {
        return {
          'success': false,
          'code': 500,
          'message': decoded['error'] ?? "passwordResetFailed".tr(),
        };
      }
    }
  }
}
