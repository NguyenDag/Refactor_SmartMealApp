import 'package:flutter/material.dart';
import 'package:smart_meal/constants/api_constant.dart';

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
              ? Image.network(
                ApiConstants.getImageUrl(imageUrl),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                      color: AppColors.onPrimary,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.restaurant,
                    size: 40,
                    color: AppColors.iconColor,
                  );
                },
              )
              : Icon(Icons.restaurant, size: 40, color: AppColors.iconColor),
    );
  }
}
