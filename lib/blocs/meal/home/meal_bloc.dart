import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/models/food_item_model.dart';
import 'package:smart_meal/models/user_info.dart';

import '../../../data/remote/weekly_meals_service.dart';
import 'meal_event.dart';
import 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealInitial()) {
    on<LoadWeeklyMeals>(_onLoadWeeklyMeals);
    on<OrderMeal>(_onOrderMeal);
    on<CancelMealOrder>(_onCancelMealOrder);
  }

  UserInfo? _userInfo;
  List<FoodItem> _meals = [];

  void _onLoadWeeklyMeals(
    LoadWeeklyMeals event,
    Emitter<MealState> emit,
  ) async {
    emit(MealLoading());

    try {
      _userInfo = await WeeklyMealsService.fetchUserInfo();
      _meals = await WeeklyMealsService.fetchWeeklyMeals();

      if (_userInfo != null) {
        emit(MealLoaded(_userInfo!, _meals));
      } else {
        emit(MealError('Không thể lấy thông tin người dùng'));
      }
    } catch (e) {
      emit(MealError('Không thể tải danh sách món ăn'));
    }
  }

  Future<void> _onOrderMeal(OrderMeal event, Emitter<MealState> emit) async {
    final result = await WeeklyMealsService.createOrder(event.mealId);

    try {
      if (result['status'] == 1) {
        _meals = await WeeklyMealsService.fetchWeeklyMeals();
        emit(MealOrderSuccess(_meals, result['message']));
      } else {
        emit(MealError(result['message']));
      }
    } catch (e) {
      emit(MealError(result['message']));
    }
  }

  Future<void> _onCancelMealOrder(
    CancelMealOrder event,
    Emitter<MealState> emit,
  ) async {
    final result = await WeeklyMealsService.cancelOrder(event.mealId);

    try {
      if (result['status'] == 1) {
        _meals = await WeeklyMealsService.fetchWeeklyMeals();
        emit(MealCancelSuccess(_meals, result['message']));
      } else {
        emit(MealError(result['message']));
      }
    } catch (e) {
      emit(MealError(result['message']));
    }
  }
}
