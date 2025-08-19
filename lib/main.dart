import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_meal/constants/app_routes.dart';
import 'package:smart_meal/constants/app_strings.dart';
import 'package:smart_meal/constants/app_colors.dart';
import 'package:smart_meal/screens/home_screen.dart';
import 'package:smart_meal/screens/login_screen.dart';
import 'package:smart_meal/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Debug settings
      debugShowCheckedModeBanner: false,

      // App info
      title: AppStrings.appTitle,

      // Theme
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.primarySwatch,
        ).copyWith(
          secondary: AppColors.secondary,
        ),
        fontFamily: AppStrings.defaultFontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
          ),
        ),
      ),

      // Localization - Chuẩn bị cho đa ngôn ngữ
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('vi'), // Vietnamese
      ],

      // Navigation
      initialRoute: AppRoutes.login,
      routes: _buildRoutes(),
    );
  }

  // Tách riêng routes để dễ quản lý
  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      AppRoutes.login: (context) => const LoginScreen(),
      AppRoutes.register: (context) => const RegisterScreen(),
      AppRoutes.home: (context) => const WeeklyMealsScreen(),
      // Có thể thêm routes khác ở đây
      // AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
      // AppRoutes.profile: (context) => const ProfileScreen(),
    };
  }
}