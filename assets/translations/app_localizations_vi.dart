// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Bữa Ăn Thông Minh';

  @override
  String get login => 'Đăng nhập';

  @override
  String get register => 'Đăng ký';

  @override
  String get fullName => 'Tên đầy đủ';

  @override
  String get employeeId => 'Mã nhân viên';

  @override
  String get password => 'Mật khẩu';

  @override
  String get confirmPassword => 'Xác nhận mật khẩu';

  @override
  String get forgotPassword => 'Quên mật khẩu?';

  @override
  String get createAccount => 'Tạo tài khoản';

  @override
  String get weeklyMeals => 'Thực đơn tuần';

  @override
  String get todayMeals => 'Bữa ăn hôm nay';

  @override
  String get breakfast => 'Bữa sáng';

  @override
  String get lunch => 'Bữa trưa';

  @override
  String get dinner => 'Bữa tối';

  @override
  String get snack => 'Đồ ăn vặt';

  @override
  String get requiredField => 'Trường này là bắt buộc';

  @override
  String get invalidEmail => 'Vui lòng nhập email hợp lệ';

  @override
  String get passwordTooShort => 'Mật khẩu phải có ít nhất 6 ký tự';

  @override
  String welcomeUser(String name) {
    return 'Chào mừng, $name!';
  }

  @override
  String mealCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bữa ăn',
      one: '1 bữa ăn',
      zero: 'Không có bữa ăn nào',
    );
    return '$_temp0';
  }
}
