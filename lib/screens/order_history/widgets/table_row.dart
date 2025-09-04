import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../models/order_history_model.dart';
import 'package:smart_meal/screens/order_history/widgets/cell_table.dart';

class TableRow extends StatelessWidget {
  final OrderHistory order;
  final bool isLastItem;

  const TableRow({super.key, required this.order, required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border(
          bottom: BorderSide(color: AppColors.blackBorder , width: 1),
        ),
        borderRadius:
            isLastItem
                ? const BorderRadius.only(
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                )
                : null,
      ),
      child: Row(
        children: [
          CellTable(text: order.id.toString(), flex: 1),
          CellTable(text: order.dishName, flex: 2),
          CellTable(text: order.supplyDate, flex: 2),
          CellTable(text: order.status, flex: 2),
        ],
      ),
    );
  }
}
