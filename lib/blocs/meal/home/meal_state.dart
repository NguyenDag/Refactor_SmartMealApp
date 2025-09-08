import 'package:equatable/equatable.dart';
import 'package:smart_meal/models/food_item_model.dart';
import 'package:smart_meal/models/user_info.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final UserInfo userInfo;
  final List<FoodItem> meals;

  const MealLoaded(this.userInfo, this.meals);

  @override
  List<Object> get props => [meals];
}

class MealError extends MealState {
  final String message;

  const MealError(this.message);

  @override
  List<Object> get props => [message];
}

class MealOrderSuccess extends MealState {
  final List<FoodItem> meals;
  final String message;

  const MealOrderSuccess(this.meals, this.message);

  @override
  List<Object> get props => [meals, message];
}

class MealCancelSuccess extends MealState {
  final List<FoodItem> meals;
  final String message;

  const MealCancelSuccess(this.meals, this.message);

  @override
  List<Object> get props => [meals, message];
}