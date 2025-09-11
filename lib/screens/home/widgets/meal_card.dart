import 'package:flutter/material.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/models/food_item_model.dart';

import 'meal_actions.dart';
import 'meal_image.dart';
import 'meal_info.dart';

class MealCard extends StatelessWidget {
  final FoodItem foodItem;

  const MealCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          children: [
            Expanded(flex: 1, child: MealImage(imageUrl: foodItem.imageUrl)),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MealInfo(foodItem: foodItem),
                  SizedBox(height: 8),
                  MealActions(foodItem: foodItem),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
