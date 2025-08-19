class AppStrings {
  // Private constructor
  AppStrings._();

  // App info
  static const String appTitle = 'Smart Meal';
  static const String appVersion = '1.0.0';
  static const String defaultFontFamily = 'Roboto';

  // Common
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String add = 'Add';
  static const String loading = 'Loading...';
  static const String error = 'Error';
  static const String success = 'Success';
  static const String retry = 'Retry';

  // Auth
  static const String login = 'Login';
  static const String register = 'Register';
  static const String logout = 'Logout';
  static const String forgotPassword = 'Forgot Password?';
  static const String createAccount = 'Create Account';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String rememberMe = 'Remember Me';

  // Navigation
  static const String home = 'Home';
  static const String profile = 'Profile';
  static const String settings = 'Settings';
  static const String back = 'Back';

  // Meals
  static const String weeklyMeals = 'Weekly Meals';
  static const String todayMeals = "Today's Meals";
  static const String breakfast = 'Breakfast';
  static const String lunch = 'Lunch';
  static const String dinner = 'Dinner';
  static const String snack = 'Snack';

  // Validation messages
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Please enter a valid email';
  static const String passwordTooShort = 'Password must be at least 6 characters';
  static const String passwordMismatch = 'Passwords do not match';

  // Error messages
  static const String networkError = 'Network connection error';
  static const String serverError = 'Server error occurred';
  static const String unknownError = 'An unknown error occurred';

  // Success messages
  static const String loginSuccess = 'Login successful';
  static const String registerSuccess = 'Registration successful';
  static const String saveSuccess = 'Saved successfully';
}