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

      }
    } catch (e) {

    }
    return null;
  }
}
