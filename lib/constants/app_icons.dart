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
}