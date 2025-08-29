import 'package:flutter/material.dart';

class AppColors {
  // Private constructor
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);

  // Primary colors
  // Màu chính của brand (AppBar, Button chính, FAB)
  static const Color primaryButton = Color(0xFF00A1CD);
  static const Color secondaryButton = Color(0xFF00B023);

  static const Color orderButton = Color(0xFFFF0000);
  static const Color cancelButton = Color(0xFF019DDB);
  static Color disableButton = Colors.black.withValues(alpha: 0.3);

  static const Color onOrderButton = Color(0xFFFFFFFF);
  static const Color onCancelButton = Color(0xFFFFFFFF);

  static const Color appBarPrimary = Color(0xFF28303F);
  static const Color linkColor = Color(0xFF549496);

  static const Color iconColor = Color(0xFFFD7555);
  static const Color whiteIconColor = Color(0xFFFFFFFF);
  static const Color blueIconColor = Colors.blue;

  // Secondary colors
  // Màu phụ để highlight, tạo accent (Links, Switch, highlights)
  static const Color secondaryLight = Color(0xFF66FFF9);
  static const Color secondaryDark = Color(0xFF00A896);

  // Surface colors
  //Màu nền các component (Card, Dialog, Scaffold background)
  static const Color surface = Color(0x6DFF9800);
  static const Color background = Color(0xFFF7F7F7);
  static const Color secondaryBackground = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  // On colors
  // Màu text/icon hiển thị TRÊN các nền màu khác (đảm bảo contrast)
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);
  static const Color onBackground = Color(0xFF000000);

  // Text colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textTitle = Color(0xFF00B023);
  static Color textDisabled = Colors.black.withValues(alpha: 0.3);

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0x6DFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Border and divider
  static const Color primaryDivider = Color(0xFF000000);
  static const Color secondaryDivider = Color(0xFF00B023);
  static Color border = Colors.grey.shade300;
  static const Color whiteBorder = Color(0xFFFFFFFF);
  static Color blackBorder = Color(0xFF000000);
  static const Color successBorder = Color(0xFF00BCD4);
  static Color errorBorder = Colors.red.shade200;
  static Color errorBackground = Colors.red.shade50;
  static Color placeholderText = Colors.grey.shade500;

  static Color boxShadow = Colors.black12;

  // table
  static Color headerHistoryTable = Color(0xFF00B023);
  static Color headerStatisticTable = Color(0xFF4E89FF);
}
