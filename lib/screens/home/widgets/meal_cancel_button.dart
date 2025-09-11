import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/l10n/app_localizations.dart';
import 'package:smart_meal/models/food_item_model.dart';

import '../../../blocs/meal/home/meal_bloc.dart';
import '../../../blocs/meal/home/meal_event.dart';

class MealCancelButton extends StatelessWidget {
  final FoodItem foodItem;

  const MealCancelButton({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final now = DateTime.now();
    final availableDate = foodItem.availableDate;
    final deadlineTime = DateTime(
      availableDate.year,
      availableDate.month,
      availableDate.day,
      10, // 10:00 AM
      0,
    );

    bool canCancelOrder = foodItem.isOrdered && now.isBefore(deadlineTime);

    Color buttonColor =
        foodItem.isOrdered ? AppColors.cancelButton : AppColors.disableButton;

    return SizedBox(
      height: 27,
      child: ElevatedButton(
        onPressed:
            foodItem.isOrdered && canCancelOrder
                ? () {
                  _showCancelConfirmation(context, foodItem);
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

  void _showCancelConfirmation(BuildContext context, FoodItem foodItem) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        final l10n = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(l10n.confirmCancel),
          content: Text(l10n.confirmMsgCancel(foodItem.nameFood)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.unconfirm),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<MealBloc>().add(CancelMealOrder(foodItem.id));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cancelButton,
              ),
              child: Text(l10n.cancel),
            ),
          ],
        );
      },
    );
  }
}
