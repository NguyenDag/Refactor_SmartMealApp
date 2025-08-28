import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/screens/home/widgets/weekly_meals_view.dart';

import '../../blocs/meal/home/meal_bloc.dart';
import '../../blocs/meal/home/meal_event.dart';

class WeeklyMealsScreen extends StatelessWidget {
  const WeeklyMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealBloc()..add(LoadWeeklyMeals()),
      child: const WeeklyMealsView(),
    );
  }
}


