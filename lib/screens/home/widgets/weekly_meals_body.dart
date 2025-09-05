import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/models/food_item_model.dart';

import '../../../blocs/meal/home/meal_bloc.dart';
import '../../../blocs/meal/home/meal_event.dart';
import '../../../blocs/meal/home/meal_state.dart';
import 'meal_card.dart';

class WeeklyMealsBody extends StatelessWidget {
  const WeeklyMealsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealBloc, MealState>(
      builder: (context, state) {
        if (state is MealLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MealLoaded ||
            state is MealOrderSuccess ||
            state is MealCancelSuccess) {
          List<FoodItem> meals = [];
          if (state is MealLoaded) meals = state.meals;
          if (state is MealOrderSuccess) meals = state.meals;
          if (state is MealCancelSuccess) meals = state.meals;

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return MealCard(foodItem: meals[index]);
            },
          );
        } else if (state is MealError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, size: 64, color: AppColors.error),
                SizedBox(height: 16),
                Text(
                  state.message,
                  style: TextStyle(fontSize: 16, color: AppColors.error),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<MealBloc>().add(LoadWeeklyMeals());
                  },
                  child: Text('Thử lại'),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
