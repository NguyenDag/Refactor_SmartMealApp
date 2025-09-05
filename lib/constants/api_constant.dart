class ApiConstants {
  static const String url = "http://30.30.30.85:7777/api";

  static String getUrl(String endPoint) {
    return url + endPoint;
  }

  static String getImageUrl(String endPoint) {
    return "http://30.30.30.85:7777$endPoint";
  }
}
