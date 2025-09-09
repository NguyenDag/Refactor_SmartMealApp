import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import '../../constants/app_images.dart';
import '../../l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      backgroundColor: AppColors.appBarPrimary,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(AppImages.menuIcon, width: 32, height: 32),
        onPressed: () {},
      ),
      title: Text(
        l10n.appTitle,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Builder(
          builder:
              (context) => IconButton(
                icon: AppIcons.menu,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
