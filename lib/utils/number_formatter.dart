class NumberFormatter {
  static String formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  static String formatVND(double amount) {
    return '${formatNumber(amount.toInt())} VNĐ';
  }
}
