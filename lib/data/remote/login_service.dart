import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/api_constant.dart';
import '../local/token_service.dart';

class LoginService {
  static Future<String?> loginAuth(String username, String password) async {
    String endPoint = '/user/login';
    final uri = Uri.parse(ApiConstants.getUrl(endPoint));

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );
      final json = jsonDecode(response.body);

      if (json['status'] == 1) {
        final token = json['token'];

        TokenService.saveToken(token);
        return null;
      } else {
        return json['message'] ?? 'Đăng nhập thất bại!';
      }
    } catch (e) {
      return 'Lỗi kết nối tới máy chủ!';
    }
  }
}
