// widgets/table_row_item.dart
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../models/statistic_model.dart';
import '../../../utils/number_formatter.dart';

class TableRowItem extends StatelessWidget {
  final Statistic statistic;
  final bool isEvenRow;

  const TableRowItem({
    super.key,
    required this.statistic,
    required this.isEvenRow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isEvenRow
                ? AppColors.rowEvenStatisticTable
                : AppColors.rowOddStatisticTable,
        border: Border(
          bottom: BorderSide(color: AppColors.blackBorder, width: 1),
        ),
      ),
      child: Row(
        children: [
          _buildCell(statistic.id.toString(), flex: 5),
          _buildCell(statistic.dishName, flex: 10),
          _buildCell(NumberFormatter.formatVND(statistic.amount), flex: 11),
          _buildCell(
            '${statistic.supplyDate.day}/${statistic.supplyDate.month}/${statistic.supplyDate.year}',
            flex: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 11, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}
