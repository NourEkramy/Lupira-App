import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpApi {
  static Future<Map<String, dynamic>> signupUser({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String dateOfBirth,
    required String phoneNumber,
    required String gender,
    required String country,
    required String ethnicity,
  }) async {
    Uri url = Uri.parse("https://lupira.onrender.com/api/auth/signup");

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "username": username,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "country": country,
      "DateOfBirth": dateOfBirth,
      "ethnicity": ethnicity,
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
          'message': decoded['message'] ?? 'signupSuccess'.tr(),
        };
      } catch (e) {
        throw FormatException("${response.body}");
      }
    } else {
      return {
        'success': false,
        'message': decoded['error'] ?? 'signupFailed'.tr(),
      };
    }
  }
}
