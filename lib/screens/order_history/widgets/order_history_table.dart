import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/order_history_model.dart';

class OrderHistoryTable extends StatelessWidget {
  final List<OrderHistory> orderHistory;

  const OrderHistoryTable({super.key, required this.orderHistory});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
          // Table content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: orderHistory.length,
                    itemBuilder: (context, index) {
                      final order = orderHistory[index];

                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.blackBorder,
                              width: 1,
                            ),
                          ),
                          borderRadius:
                          index == orderHistory.length - 1
                              ? BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          )
                              : null,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  order.id.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  order.dishName,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  order.supplyDate,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  order.status,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}