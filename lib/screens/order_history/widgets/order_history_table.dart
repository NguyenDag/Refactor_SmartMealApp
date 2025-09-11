import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/blocs/meal/order_history/order_history_bloc.dart';
import 'package:smart_meal/blocs/meal/order_history/order_history_event.dart';
import 'package:smart_meal/blocs/meal/order_history/order_history_state.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/ordered_food_item_model.dart';
import 'order_history_table_content.dart';

class OrderHistoryTable extends StatelessWidget {
  const OrderHistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
      builder: (context, state) {
        if (state is OrderHistoryLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is OrderHistoryLoaded) {
          List<OrderedFoodItem> orderedFoodList = state.orderedFoodList;

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                // Table header
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.headerHistoryTable,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            l10n.no1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            l10n.dishName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            l10n.supplyDate,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            l10n.status,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                OrderHistoryTableContent(orderedFoodList: orderedFoodList),
              ],
            ),
          );
        } else if (state is OrderHistoryError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcons.error,
                SizedBox(height: 16),
                Text(
                  state.message,
                  style: TextStyle(fontSize: 16, color: AppColors.error),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<OrderHistoryBloc>().add(LoadOrderHistory());
                  },
                  child: Text(l10n.tryAgain),
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
