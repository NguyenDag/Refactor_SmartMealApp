import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppIcons {
  // Default icon size for consistency
  static const double defaultSize = 24.0;

  // Location icon
  static Icon get menu => Icon(
    Icons.menu,
    color: AppColors.whiteIconColor,
    size: defaultSize,
  );

  static Icon get restaurant => Icon(
    Icons.restaurant,
    color: AppColors.iconColor,
    size: 40,
  );

  static Icon get error => Icon(
    Icons.error,
    color: AppColors.error,
    size: 64,
  );
}