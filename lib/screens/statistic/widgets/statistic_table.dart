import 'package:flutter/material.dart';
import 'package:smart_meal/screens/statistic/widgets/table_header.dart';
import 'package:smart_meal/screens/statistic/widgets/table_row_item.dart';

import '../../../models/statistic_model.dart';

class StatisticTable extends StatelessWidget {
  final List<Statistic> statistics;

  const StatisticTable({super.key, required this.statistics});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: [const TableHeader(), _buildTableContent()]),
    );
  }

  Widget _buildTableContent() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: statistics.length,
          itemBuilder: (context, index) {
            final statistic = statistics[index];
            final isEvenRow = index % 2 == 0;

            return TableRowItem(statistic: statistic, isEvenRow: isEvenRow);
          },
        ),
      ],
    );
  }
}
