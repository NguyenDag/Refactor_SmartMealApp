import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class MealImage extends StatelessWidget {
  final String imageUrl;

  const MealImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      decoration: BoxDecoration(color: AppColors.surface),
      child:
          imageUrl.isNotEmpty
              ? Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.restaurant, size: 40, color: AppColors.iconColor);
                },
              )
              : Icon(Icons.restaurant, size: 40, color: AppColors.iconColor),
    );
  }
}
