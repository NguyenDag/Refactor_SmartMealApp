import 'package:flutter/material.dart';
import 'package:smart_meal/models/food_item_model.dart';

import 'meal_cancel_button.dart';
import 'meal_order_button.dart';

class MealActions extends StatelessWidget {
  final FoodItem foodItem;

  const MealActions({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: MealCancelButton(foodItem: foodItem)),
        SizedBox(width: 8),
            Expanded(child: MealOrderButton(foodItem: foodItem)),
      ],
    );
  }
}
