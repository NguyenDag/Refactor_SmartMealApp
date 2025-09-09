import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_meal/models/ordered_food_item_model.dart';

import '../../../constants/app_colors.dart';
import 'package:smart_meal/screens/order_history/widgets/cell_table.dart';

class TableRow extends StatelessWidget {
  final OrderedFoodItem order;
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
          CellTable(text: order.nameFood, flex: 2),
          CellTable(text: DateFormat('dd/MM/yyyy').format(order.orderDate), flex: 2),
          CellTable(text: order.status, flex: 2),
        ],
      ),
    );
  }
}
