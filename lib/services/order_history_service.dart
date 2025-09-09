import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_meal/models/ordered_food_item_model.dart';
import 'package:smart_meal/services/token_service.dart';

import '../constants/api_constant.dart';

class OrderHistoryService {
  static Future<List<OrderedFoodItem>> getAllOrdersByUserId() async {
    final token = await TokenService.getToken();
    if (token == null) {
      return [];
    }

    final endPoint = '/orders/getAllOrdersByUserId';
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

        List<dynamic> rawList = json['data'];

        List<OrderedFoodItem> orderedFoodItems =
            rawList.map((item) => OrderedFoodItem.fromJson(item)).toList();

        return orderedFoodItems;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching weekly meals: $e');
      }
    }
    return [];
  }
}
