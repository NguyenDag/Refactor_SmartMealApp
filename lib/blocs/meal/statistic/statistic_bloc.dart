import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/blocs/meal/statistic/statistic_event.dart';
import 'package:smart_meal/blocs/meal/statistic/statistic_state.dart';

import '../../../data/remote/meal_statistics_service.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(StatisticInitial()) {
    on<LoadStatistic>(_onLoadStatistic);
    on<SearchStatistic>(_onSearchStatistic);
  }

  Future<void> _onLoadStatistic(
    LoadStatistic event,
    Emitter<StatisticState> emit,
  ) async {
    emit(StatisticLoading());

    try {
      final orderedFoodList =
          await MealStatisticsService.getOrderHistoryByMonth(
            month: event.month,
            year: event.year,
          );
      //dùng để gộp (reduce) toàn bộ phần tử của danh sách thành một giá trị duy nhất
      final total = orderedFoodList.fold(
        0.0,
        (sum, item) => sum + item.price * item.quantity,
      );

      emit(StatisticLoaded(orderedFoodList, total, event.month, event.year));
    } catch (e) {
      emit(StatisticError('Không thể tải dữ liệu: ${e.toString()}'));
    }
  }

  Future<void> _onSearchStatistic(
    SearchStatistic event,
    Emitter<StatisticState> emit,
  ) async {
    add(LoadStatistic(event.month, event.year));
  }
}
