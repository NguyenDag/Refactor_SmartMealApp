import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class OrderHistoryHeader extends StatelessWidget {
  const OrderHistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: AppColors.secondaryBackground),
            child: const Icon(
              Icons.history,
              color: AppColors.blueIconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            l10n.orderHistory,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
