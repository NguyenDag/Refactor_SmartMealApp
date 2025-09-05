import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_meal/services/token_service.dart';
import '../constants/api_constant.dart';

class RegisterService {
  static bool isFormatUsername(String username) =>
      username.trim().contains(' ');

  static bool isFormatEmployeeId(String employeeId) =>
      employeeId.trim().contains(' ');

  static Future<String?> registerAuth(
    String fullName,
    String employeeId,
    String username,
    String password,
  ) async {
    String endPoint = '/user/createNewUser';
    final uri = Uri.parse(ApiConstants.getUrl(endPoint));

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'fullname': fullName,
          'employeeCode': employeeId,
          'role': "user",
        }),
      );

      final json = jsonDecode(response.body);
      if (json['status'] == 1) {
        final token = json['token'];

        TokenService.saveToken(token);
        return null;
      } else {
        return json['message'] ?? 'Đăng ký thất bại!';
      }
    } catch (e) {
      return 'Lỗi kết nối tới máy chủ!';
    }
  }
}
