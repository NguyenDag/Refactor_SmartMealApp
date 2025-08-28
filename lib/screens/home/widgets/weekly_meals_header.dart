import 'package:flutter/material.dart';
import 'package:smart_meal/constants/app_colors.dart';

import '../../../l10n/app_localizations.dart';

class WeeklyMealsHeader extends StatelessWidget {
  final String userName = 'Lê Văn Thành';

  const WeeklyMealsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            l10n.welcomeUser(userName),
            style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.restaurant_menu, color: AppColors.iconColor, size: 24),
              SizedBox(width: 8),
              Text(
                l10n.weeklyMeals,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 1),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            l10n.noteOrder,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textPrimary,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
