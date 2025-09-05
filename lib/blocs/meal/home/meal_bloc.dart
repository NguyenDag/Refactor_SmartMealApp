import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/models/food_item_model.dart';

import '../../../services/weekly_meals_service.dart';
import 'meal_event.dart';
import 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealInitial()) {
    on<LoadWeeklyMeals>(_onLoadWeeklyMeals);
    on<OrderMeal>(_onOrderMeal);
    on<CancelMealOrder>(_onCancelMealOrder);
  }

  List<FoodItem> _meals = [];

  void _onLoadWeeklyMeals(
    LoadWeeklyMeals event,
    Emitter<MealState> emit,
  ) async {
    // emit(MealLoading());

    try {
      _meals = await WeaklyMealsService.fetchWeeklyMeals();

      emit(MealLoaded(_meals));
    } catch (e) {
      emit(MealError('Không thể tải danh sách món ăn'));
    }
  }

  void _onOrderMeal(OrderMeal event, Emitter<MealState> emit) {
    try {
      final mealIndex = _meals.indexWhere((meal) => meal.id == event.mealId);
      if (mealIndex != -1) {
        _meals[mealIndex] = _meals[mealIndex].copyWith(isOrdered: true);
        emit(MealOrderSuccess(_meals, 'Đặt món ăn thành công'));
      } else {
        emit(MealError('Không tìm thấy món ăn'));
      }
    } catch (e) {
      emit(MealError('Không thể đặt món ăn'));
    }
  }

  void _onCancelMealOrder(CancelMealOrder event, Emitter<MealState> emit) {
    try {
      final mealIndex = _meals.indexWhere((meal) => meal.id == event.mealId);
      if (mealIndex != -1) {
        _meals[mealIndex] = _meals[mealIndex].copyWith(isOrdered: false);
        emit(MealCancelSuccess(_meals, 'Hủy đặt món ăn thành công'));
      }
    } catch (e) {
      emit(MealError('Không thể hủy món'));
    }
  }
}
