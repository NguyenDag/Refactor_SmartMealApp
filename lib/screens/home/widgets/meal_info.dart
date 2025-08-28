import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_meal/constants/app_colors.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/meal_model.dart';

class MealInfo extends StatelessWidget {
  final Meal meal;

  const MealInfo({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meal.name,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 4),
        Text(
          l10n.formatAmount(NumberFormat('#,###', 'vi_VN').format(meal.price)),
          style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
        ),
        SizedBox(height: 4),
        Text(
          l10n.formatDate(DateFormat('dd/MM/yyyy').format(meal.serviceDate)),
          style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
