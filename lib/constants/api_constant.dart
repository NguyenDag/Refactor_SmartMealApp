class ApiConstants {
  static const String url = "http://30.30.30.85:7777/api";
  // static const String url = "http://192.168.137.1:7777/api";

  static String getUrl(String endPoint) {
    return url + endPoint;
  }

  static String getImageUrl(String endPoint) {
    return "http://30.30.30.85:7777$endPoint";
    // return "http://192.168.137.1:7777$endPoint";
  }
}
