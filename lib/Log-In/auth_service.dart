import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<bool> isTokenValid() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final loginTimeStr = prefs.getString('loginTime');

    if (token == null || loginTimeStr == null) return false;

    final loginTime = DateTime.parse(loginTimeStr);
    final now = DateTime.now();
    final difference = now.difference(loginTime);

    // Token expires after 7 days
    return difference.inDays < 7;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');
    await prefs.remove('email');
    await prefs.remove('loginTime');

  }
}
