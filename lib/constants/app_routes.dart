class AppRoutes {
  // Private constructor để ngăn tạo instance
  AppRoutes._();

  // Auth routes
  static const String login = '/';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Main app routes
  static const String home = '/home';
  static const String orderHistory = '/order-history';
  static const String statisticMeals = '/statistic-meals';

  // Meal related routes
  // static const String mealDetail = '/meal-detail';
  // static const String addMeal = '/add-meal';
  // static const String editMeal = '/edit-meal';

  // All routes list - để kiểm tra route có tồn tại không
  static const List<String> allRoutes = [
    login,
    register,
    forgotPassword,
    home,
    orderHistory,
    statisticMeals,
  ];
}