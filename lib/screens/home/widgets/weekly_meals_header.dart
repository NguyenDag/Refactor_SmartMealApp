import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/blocs/meal/home/meal_bloc.dart';
import 'package:smart_meal/blocs/meal/home/meal_state.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/constants/app_images.dart';

import '../../../l10n/app_localizations.dart';

class WeeklyMealsHeader extends StatelessWidget {
  const WeeklyMealsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<MealBloc, MealState>(
            builder: (context, state) {
              if (state is MealLoading) {
                return Row(
                  children: [
                    SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      l10n.welcomeUser("..."),
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                );
              }

              String userName = "User"; // Default fallback
              if (state is MealLoaded) {
                userName = state.userInfo.fullName;
              }

              return Text(
                l10n.welcomeUser(userName),
                style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Image.asset(
                AppImages.menuIcon,
                width: 24,
                height: 24,
              ),
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
