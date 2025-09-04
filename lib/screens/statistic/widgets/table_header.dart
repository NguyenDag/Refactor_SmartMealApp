// widgets/table_header.dart
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryButton,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Row(
        children: [
          _buildHeaderCell(l10n.no1, flex: 5),
          _buildHeaderCell(l10n.dishName, flex: 10),
          _buildHeaderCell(l10n.amount, flex: 11),
          _buildHeaderCell(l10n.supplyDate, flex: 10),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
