import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/user_profile_data_model.dart';

class ProfileApi {
  static Future<UserProfileDataModel?> fetchProfile(String token) async {
    final url = Uri.parse('https://lupira.onrender.com/api/users/profile');

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
        UserProfileDataModel model = UserProfileDataModel.fromJson(jsonData);
        return model;
      } else {
        print("Failed to fetch profile: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching profile: $e");
    }
    return null;
  }

  static Future<Map<String, dynamic>> applyProfileEdits({
    String username = '',
    String email = '',
    String dateOfBirth = '',
    String phoneNumber = '',
    String gender = '',
    String country = '',
    String ethnicity = '',
    required String token,
  }) async {
    Uri url = Uri.parse("https://lupira.onrender.com/api/users/profile");

    final headers = {
      "Authorization": "Bearer $token",
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "username": username,
      "email": email,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "country": country,
      "DateOfBirth": dateOfBirth,
      "ethnicity": ethnicity,
    });

    final response = await http.put(
      url,
      headers: headers,
      body: body,
    );

    final decoded = jsonDecode(response.body);

    if (response.statusCode == 200) {
      try {
        return {
          'success': true,
          'message': decoded['message'] ?? 'Data updated successfully',
        };
      } catch (e) {
        throw FormatException("Invalid JSON format: ${response.body}");
      }
    } else {
      return {
        'success': false,
        'message': decoded['error'] ?? 'Failed to update data',
      };
    }
  }
}
