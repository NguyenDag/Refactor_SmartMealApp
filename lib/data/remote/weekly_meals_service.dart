import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_meal/models/food_item_model.dart';
import 'package:smart_meal/models/user_info.dart';

import '../../constants/api_constant.dart';
import '../local/token_service.dart';

class WeeklyMealsService {
  static Future<List<FoodItem>> fetchWeeklyMeals() async {
    final token = await TokenService.getToken();
    if (token == null) {
      return [];
    }

    final endPoint = '/foodItems/getFoodItemsOnThisWeek';
    final url = Uri.parse(ApiConstants.getUrl(endPoint));

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final status = json['status'];

        if (status == 1) {
          List<dynamic> rawList = json['data'];

          List<FoodItem> foodItems =
              rawList.map((item) => FoodItem.fromJson(item)).toList();

          return foodItems;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching weekly meals: $e');
      }
    }
    return [];
  }

  static Future<UserInfo?> fetchUserInfo() async {
    final token = await TokenService.getToken();
    if (token == null) {
      return null;
    }

    final endPoint = '/user/getUserInfo';
    final url = Uri.parse(ApiConstants.getUrl(endPoint));

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final status = json['status'];

        if (status == 1) {
          final rawData = json['data'];

          UserInfo userInfo = UserInfo.fromJson(rawData);
          return userInfo;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user info: $e');
      }
    }
    return null;
  }

  static Future<Map<String, dynamic>> createOrder(int id) async {
    final token = await TokenService.getToken();

    if (token == null) {
      return {'status': 0, 'message': 'Chưa đăng nhập!'};
    }

    final endPoint = '/orders/createOrder/$id';
    final uri = Uri.parse(ApiConstants.getUrl(endPoint));

    try {
      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'quantity': 1, 'statusOrder': 'ordered'}),
      );
      final json = jsonDecode(response.body);

      if (json['status'] == 1) {
        return {
          'status': 1,
          'orderId': json['orderId'],
          'message': json['message'],
        };
      } else {
        return {
          'status': 0,
          'message': json['message'] ?? 'Tạo đơn hàng thất bại!',
        };
      }
    } catch (e) {
      return {'status': 0, 'message': 'Lỗi kết nối tới máy chủ!'};
    }
  }

  static Future<Map<String, dynamic>> cancelOrder(int id) async {
    final token = await TokenService.getToken();

    if (token == null) {
      return {'status': 0, 'message': 'Chưa đăng nhập!'};
    }

    final endPoint = '/orders/cancelOrder/$id';
    final uri = Uri.parse(ApiConstants.getUrl(endPoint));

    try {
      final response = await http.delete(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      final json = jsonDecode(response.body);

      if (json['status'] == 1) {
        return {'status': 1, 'message': json['message']};
      } else {
        return {
          'status': 0,
          'message': json['message'] ?? 'Tạo đơn hàng thất bại!',
        };
      }
    } catch (e) {
      return {'status': 0, 'message': 'Lỗi kết nối tới máy chủ!'};
    }
  }
}
