import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const _tokenKey = 'token';
  static const _loginTime = 'login_time';

  static Future<void> saveToken(String token,) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_loginTime);
  }
}
