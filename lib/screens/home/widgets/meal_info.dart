import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/models/food_item_model.dart';

import '../../../l10n/app_localizations.dart';

class MealInfo extends StatelessWidget {
  final FoodItem foodItem;

  const MealInfo({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          foodItem.nameFood,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 4),
        Text(
          l10n.formatAmount(NumberFormat('#,###', 'vi_VN').format(foodItem.price)),
          style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
        ),
        SizedBox(height: 4),
        Text(
          l10n.formatDate(DateFormat('dd/MM/yyyy').format(foodItem.availableDate)),
          style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
