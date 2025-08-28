import 'package:flutter/material.dart';
import 'package:smart_meal/models/meal_model.dart';

import 'meal_cancel_button.dart';
import 'meal_order_button.dart';

class MealActions extends StatelessWidget {
  final Meal meal;

  const MealActions({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: MealCancelButton(meal: meal)),
        SizedBox(width: 8),
        Expanded(child: MealOrderButton(meal: meal)),
      ],
    );
  }
}
