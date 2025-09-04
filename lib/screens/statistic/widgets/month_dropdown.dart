import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class MonthDropdown extends StatelessWidget {
  final int selectedMonth;
  final ValueChanged<int?> onChanged;

  const MonthDropdown({
    super.key,
    required this.selectedMonth,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedMonth,
          items:
              List.generate(12, (index) => index + 1)
                  .map(
                    (month) => DropdownMenuItem(
                      value: month,
                      child: Text(
                        month.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
