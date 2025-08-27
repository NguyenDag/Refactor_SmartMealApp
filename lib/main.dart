import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_meal/constants/app_routes.dart';
import 'package:smart_meal/constants/app_strings.dart';
import 'package:smart_meal/screens/home/home_screen.dart';
import 'package:smart_meal/screens/login_screen.dart';
import 'package:smart_meal/screens/register_screen.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Locale locale = const Locale('en');
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: AppStrings.appTitle,
      locale: locale,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seedColor),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),

      localizationsDelegates: const [
        AppLocalizations.delegate,
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
