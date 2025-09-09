class DateHelper {
  static List<String> getMonthNames() {
    return [
      'Tháng 1',
      'Tháng 2',
      'Tháng 3',
      'Tháng 4',
      'Tháng 5',
      'Tháng 6',
      'Tháng 7',
      'Tháng 8',
      'Tháng 9',
      'Tháng 10',
      'Tháng 11',
      'Tháng 12',
    ];
  }

  static String getMonthName(int month) {
    final months = getMonthNames();
    return months[month - 1];
  }

  static List<int> getAvailableYears() {
    final currentYear = DateTime.now().year;
    return List.generate(5, (index) => currentYear - index);
  }

  static String formatMonthYear(int month, int year) {
    return '${getMonthName(month)} $year';
  }

  static bool isCurrentMonth(int month, int year) {
    final now = DateTime.now();
    return month == now.month && year == now.year;
  }

  static bool isFutureMonth(int month, int year) {
    final now = DateTime.now();
    final selectedDate = DateTime(year, month);
    final currentDate = DateTime(now.year, now.month);
    return selectedDate.isAfter(currentDate);
  }
}
