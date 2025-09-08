class UserInfo {
  final int id;
  final String username;
  final String fullName;
  final String password;
  final String employeeCode;
  final String role;
  final DateTime createdAt;

  UserInfo({
    required this.id,
    required this.username,
    required this.fullName,
    required this.password,
    required this.employeeCode,
    required this.role,
    required this.createdAt,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'] as int,
      username: json['username'],
      fullName: json['fullname'],
      password: json['password'],
      employeeCode: json['employee_code'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'fullname': fullName,
      'password': password,
      'employee_code': employeeCode,
      'role': role,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
