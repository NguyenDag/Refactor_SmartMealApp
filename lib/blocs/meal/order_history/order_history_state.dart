import 'package:equatable/equatable.dart';
import 'package:smart_meal/models/ordered_food_item_model.dart';

abstract class OrderHistoryState extends Equatable {
  const OrderHistoryState();

  @override
  List<Object> get props => [];
}

class OrderHistoryInitial extends OrderHistoryState {}

class OrderHistoryLoading extends OrderHistoryState {}

class OrderHistoryLoaded extends OrderHistoryState {
  final List<OrderedFoodItem> orderedFoodList;

  const OrderHistoryLoaded(this.orderedFoodList);

  @override
  List<Object> get props => [orderedFoodList];
}

class OrderHistoryError extends OrderHistoryState {
  final String message;

  const OrderHistoryError(this.message);

  @override
  List<Object> get props => [message];
}