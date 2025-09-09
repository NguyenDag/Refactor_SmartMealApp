import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_meal/models/meal_statistics_model.dart';
import 'package:smart_meal/services/token_service.dart';

import '../constants/api_constant.dart';

class MealStatisticsService {
  static Future<List<MealStatistics>> getOrderHistoryByMonth({
    required int month,
    required int year,
  }) async {
    final token = await TokenService.getToken();
    if (token == null) {
      return [];
    }

    final endPoint = '/orders/getAllOrderByUserIdForMonthYear';
    final url = Uri.parse(ApiConstants.getUrl(endPoint));

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'month': month, 'year': year}),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final status = json['status'];
        if (status != 1) {
          return [];
        }
        List<dynamic> rawList = json['data'];

        List<MealStatistics> mealStatistics =
            rawList.map((item) => MealStatistics.fromJson(item)).toList();

        return mealStatistics;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching weekly meals: $e');
      }
    }
    return [];
  }
}
