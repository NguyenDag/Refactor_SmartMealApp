import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CellTable extends StatelessWidget {
  final String text;
  final int flex;

  const CellTable({super.key, required this.text, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
