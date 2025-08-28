import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/l10n/app_localizations.dart';
import 'package:smart_meal/models/meal_model.dart';

import '../../../blocs/meal/home/meal_bloc.dart';
import '../../../blocs/meal/home/meal_event.dart';

class MealOrderButton extends StatelessWidget {
  final Meal meal;

  const MealOrderButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final now = DateTime.now();
    final serviceDate = meal.serviceDate;
    final deadlineTime = DateTime(
      serviceDate.year,
      serviceDate.month,
      serviceDate.day,
      10,
      0,
      0,
    );

    bool isPastDeadline = now.isAfter(deadlineTime);
    bool canOrder = !meal.isOrdered && !isPastDeadline;

    Color buttonColor;
    String buttonText;

    if (meal.isOrdered) {
      buttonColor = AppColors.disableButton;
      buttonText = l10n.ordered;
    } else if (isPastDeadline) {
      buttonColor = AppColors.disableButton;
      buttonText = l10n.expired;
    } else {
      buttonColor = AppColors.orderButton;
      buttonText = l10n.order;
    }

    return SizedBox(
      height: 27,
      child: ElevatedButton(
        onPressed:
            canOrder
                ? () {
                  _showOrderConfirmation(context, meal);
                }
                : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: AppColors.onOrderButton,
          padding: EdgeInsets.symmetric(horizontal: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _showOrderConfirmation(BuildContext context, Meal meal) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        final l10n = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(l10n.confirmOrder),
          content: Text(l10n.confirmMsgOrder(meal.name)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<MealBloc>().add(OrderMeal(meal.id));
              },
              child: Text(l10n.order),
            ),
          ],
        );
      },
    );
  }
}
