import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/blocs/meal/order_history/order_history_event.dart';
import 'package:smart_meal/blocs/meal/order_history/order_history_state.dart';
import 'package:smart_meal/models/ordered_food_item_model.dart';

import '../../../data/remote/order_history_service.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  OrderHistoryBloc() : super(OrderHistoryInitial()) {
    on<LoadOrderHistory>(_onLoadOrderHistory);
    on<RefreshOrderHistory>(_onRefreshOrderHistory);
  }

  List<OrderedFoodItem> _orderedFoodList = [];
  Future<void> _onLoadOrderHistory(
    LoadOrderHistory event,
    Emitter<OrderHistoryState> emit,
  ) async {
    emit(OrderHistoryLoading());

    try {
      _orderedFoodList = await OrderHistoryService.getAllOrdersByUserId();

      emit(OrderHistoryLoaded(_orderedFoodList));
    } catch (e) {
      emit(OrderHistoryError('Không thể tải lịch sử danh sách món ăn'));
    }
  }

  FutureOr<void> _onRefreshOrderHistory(
    RefreshOrderHistory event,
    Emitter<OrderHistoryState> emit,
  ) {}
}
