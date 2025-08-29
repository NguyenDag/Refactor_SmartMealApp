import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/screens/home/widgets/weekly_meals_body.dart';
import 'package:smart_meal/screens/home/widgets/weekly_meals_header.dart';
import 'package:smart_meal/widgets/common/custom_app_bar.dart';

import '../../../blocs/meal/home/meal_bloc.dart';
import '../../../blocs/meal/home/meal_state.dart';
import '../../../widgets/common/custom_app_drawer.dart';

class WeeklyMealsView extends StatefulWidget {
  const WeeklyMealsView({super.key});

  @override
  State<WeeklyMealsView> createState() => _WeeklyMealsViewState();
}

class _WeeklyMealsViewState extends State<WeeklyMealsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const CustomAppBar(),
        endDrawer: CustomAppDrawer(),
        body: BlocListener<MealBloc, MealState>(
          listener: (context, state) {
            if (state is MealOrderSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.success,
                ),
              );
            } else if (state is MealCancelSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.warning,
                ),
              );
            } else if (state is MealError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.error,
                ),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WeeklyMealsHeader(),
              Expanded(child: WeeklyMealsBody()),
            ],
          ),
        ),
      ),
    );
  }
}
