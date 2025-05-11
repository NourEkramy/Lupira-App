import 'package:http/http.dart' as http;

class DeleteAccountApi {

  static Future<bool> deleteAccount(String token) async {
    final url = Uri.parse('https://lupira.onrender.com/api/auth/delete');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.delete(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Delete account failed: ${response.body}');
      return false;
    }
  }
}
