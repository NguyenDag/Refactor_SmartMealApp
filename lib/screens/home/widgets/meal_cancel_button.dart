import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/l10n/app_localizations.dart';

import '../../../blocs/meal/home/meal_bloc.dart';
import '../../../blocs/meal/home/meal_event.dart';
import '../../../models/meal_model.dart';

class MealCancelButton extends StatelessWidget {
  final Meal meal;

  const MealCancelButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final now = DateTime.now();
    final serviceDate = meal.serviceDate;
    final deadlineTime = DateTime(
      serviceDate.year,
      serviceDate.month,
      serviceDate.day,
      10, // 10:00 AM
      0,
    );

    bool canCancelOrder = meal.isOrdered && now.isBefore(deadlineTime);

    Color buttonColor =
        meal.isOrdered ? AppColors.cancelButton : AppColors.disableButton;

    return SizedBox(
      height: 27,
      child: ElevatedButton(
        onPressed:
            meal.isOrdered && canCancelOrder
                ? () {
                  _showCancelConfirmation(context, meal);
                }
                : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: AppColors.onCancelButton,
          padding: EdgeInsets.symmetric(horizontal: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          l10n.cancel,
          style: TextStyle(fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _showCancelConfirmation(BuildContext context, Meal meal) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        final l10n = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(l10n.confirmCancel),
          content: Text(l10n.confirmMsgCancel(meal.name)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<MealBloc>().add(CancelMealOrder(meal.id));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cancelButton,
              ),
              child: Text(l10n.expired),
            ),
          ],
        );
      },
    );
  }
}
