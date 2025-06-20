import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  final String baseUrl =
      'http://10.0.2.2/api_skripsi'; // ganti kalau pakai device fisik

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login.php'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result['status'] == true) {
          return UserModel.fromJson(result['data']);
        }
      }
    } catch (e) {
      print('Login error: $e');
    }
    return null;
  }
}
