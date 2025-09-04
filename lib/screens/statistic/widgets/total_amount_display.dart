import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/number_formatter.dart';

class TotalAmountDisplay extends StatelessWidget {
  final double totalAmount;

  const TotalAmountDisplay({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            l10n.totalAmount(NumberFormatter.formatNumber(totalAmount.toInt())),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
