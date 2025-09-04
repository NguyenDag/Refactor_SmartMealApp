import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class YearDropdown extends StatelessWidget {
  final int selectedYear;
  final ValueChanged<int?> onChanged;

  const YearDropdown({
    super.key,
    required this.selectedYear,
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
          value: selectedYear,
          items:
              List.generate(5, (index) => 2021 + index)
                  .map(
                    (year) => DropdownMenuItem(
                      value: year,
                      child: Text(
                        year.toString(),
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
