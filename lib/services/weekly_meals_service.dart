import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_meal/models/food_item_model.dart';
import 'package:smart_meal/services/token_service.dart';

import '../constants/api_constant.dart';

class WeaklyMealsService {
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
}
