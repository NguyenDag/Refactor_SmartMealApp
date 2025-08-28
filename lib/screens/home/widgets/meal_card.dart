import 'package:flutter/material.dart';
import 'package:smart_meal/constants/app_colors.dart';

import '../../../models/meal_model.dart';
import 'meal_actions.dart';
import 'meal_image.dart';
import 'meal_info.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          children: [
            Expanded(flex: 1, child: MealImage(imageUrl: meal.imageUrl)),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MealInfo(meal: meal),
                  SizedBox(height: 8),
                  MealActions(meal: meal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
