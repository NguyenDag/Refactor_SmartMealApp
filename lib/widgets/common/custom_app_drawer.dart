import 'package:flutter/material.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/constants/app_images.dart';
import 'package:smart_meal/screens/statistic/statistic_screen.dart';

import '../../l10n/app_localizations.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/order_history/order_history_screen.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header của drawer
            _buildDrawerHeader(l10n.appTitle),

            // Các mục menu
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(
                    iconImage: AppImages.mealIcon,
                    iconColor: AppColors.iconColor,
                    title: l10n.weeklyMeals,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WeeklyMealsScreen(),
                        ),
                      );
                    },
                  ),

                  _buildMenuItem(
                    iconImage: AppImages.orderHistoryIcon,
                    iconColor: AppColors.blueIconColor,
                    title: l10n.orderHistory,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OrderHistoryScreen(),
                        ),
                      );
                    },
                  ),

                  _buildMenuItem(
                    iconImage: AppImages.mealStatisticIcon,
                    iconColor: AppColors.blueIconColor,
                    title: l10n.mealStatistics,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StatisticScreen(),
                        ),
                      );
                    },
                  ),

                  _buildMenuItem(
                    iconImage: AppImages.logoutIcon,
                    iconColor: AppColors.blueIconColor,
                    title: l10n.logout,
                    onTap: () {
                      Navigator.pop(context);
                      _showLogoutConfirmDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(String appTitle) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            IconButton(
              icon: Image.asset(AppImages.menuIcon, width: 32, height: 32),
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            Text(
              appTitle,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconImage,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Image.asset(iconImage, width: 20, height: 20),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }

  void _showLogoutConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final l10n = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(l10n.logoutConfirm),
          content: Text(l10n.logoutMsg),
          actions: [
            TextButton(
              child: Text(l10n.unconfirm),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                l10n.logout,
                style: TextStyle(color: AppColors.warning),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
