import 'package:flutter/material.dart';
import 'package:smart_meal/screens/statistic/widgets/year_dropdown.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../l10n/app_localizations.dart';
import 'month_dropdown.dart';

class StatisticHeader extends StatelessWidget {
  final int selectedMonth;
  final int selectedYear;
  final ValueChanged<int?> onMonthChanged;
  final ValueChanged<int?> onYearChanged;
  final VoidCallback onSearchPressed;

  const StatisticHeader({
    super.key,
    required this.selectedMonth,
    required this.selectedYear,
    required this.onMonthChanged,
    required this.onYearChanged,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(l10n),
          const SizedBox(height: 8),
          Divider(thickness: 1, color: AppColors.blackBorder),
          const SizedBox(height: 8),
          _buildFilterRow(l10n),
        ],
      ),
    );
  }

  Widget _buildTitle(AppLocalizations l10n) {
    return Row(
      children: [
        Image.asset(AppImages.mealStatisticIcon, width: 24, height: 24),
        const SizedBox(width: 8),
        Text(
          l10n.mealStatistics,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterRow(AppLocalizations l10n) {
    return Row(
      children: [
        Text(
          l10n.month,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        ),
        const SizedBox(width: 5),
        MonthDropdown(selectedMonth: selectedMonth, onChanged: onMonthChanged),
        const SizedBox(width: 12),
        Text(
          l10n.year,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        ),
        const SizedBox(width: 5),
        YearDropdown(selectedYear: selectedYear, onChanged: onYearChanged),
        const Spacer(),
        _buildSearchButton(l10n),
      ],
    );
  }

  Widget _buildSearchButton(AppLocalizations l10n) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onSearchPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryButton,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(l10n.search, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
