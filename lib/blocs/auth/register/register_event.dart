import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String fullName;
  final String employeeId;
  final String username;
  final String password;

  const RegisterRequest({
    required this.fullName,
    required this.employeeId,
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [fullName, employeeId, username, password];
}

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class FullNameChanged extends RegisterEvent {
  final String fullName;
  final String? errorMessage;

  const FullNameChanged(this.fullName, {this.errorMessage});

  @override
  List<Object> get props => [fullName];
}

class EmployeeIdChanged extends RegisterEvent {
  final String employeeId;
  final String? emptyErrorMessage;
  final String? invalidErrorMessage;

  const EmployeeIdChanged(
    this.employeeId, {
    this.emptyErrorMessage,
    this.invalidErrorMessage,
  });

  @override
  List<Object> get props => [employeeId];
}

class UsernameChanged extends RegisterEvent {
  final String username;
  final String? emptyErrorMessage;
  final String? invalidErrorMessage;

  const UsernameChanged(
    this.username, {
    this.emptyErrorMessage,
    this.invalidErrorMessage,
  });

  @override
  List<Object> get props => [username];
}

class PasswordChanged extends RegisterEvent {
  final String password;
  final String? emptyErrorMessage;
  final String? tooShortErrorMessage;

  const PasswordChanged(
    this.password, {
    this.emptyErrorMessage,
    this.tooShortErrorMessage,
  });

  @override
  List<Object> get props => [password];
}

class RegisterSubmitted extends RegisterEvent {
  final String fullName;
  final String employeeId;
  final String username;
  final String password;

  final String? fullNameError;
  final String? emptyEIdError;
  final String? invalidEIdError;
  final String? emptyUsernameError;
  final String? invalidUsernameError;
  final String? emptyPasswordError;
  final String? tooShortPasswordError;

  const RegisterSubmitted({
    required this.fullName,
    required this.employeeId,
    required this.username,
    required this.password,
    this.fullNameError,
    this.emptyEIdError,
    this.invalidEIdError,
    this.emptyUsernameError,
    this.invalidUsernameError,
    this.emptyPasswordError,
    this.tooShortPasswordError,
  });
}

class BackToLoginPressed extends RegisterEvent {
  const BackToLoginPressed();
}
