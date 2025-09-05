import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/blocs/auth/register/register_event.dart';
import 'package:smart_meal/blocs/auth/register/register_state.dart';
import 'package:smart_meal/services/register_service.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<FullNameChanged>(_onFullNameChanged);
    on<EmployeeIdChanged>(_onEmployeeIdChanged);
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<BackToLoginPressed>(_onBackToLoginPressed);
  }

  void _onFullNameChanged(FullNameChanged event, Emitter<RegisterState> emit) {
    final fieldErrors = Map<String, String>.from(state.fieldErrors);
    if (event.fullName.isEmpty && event.errorMessage != null) {
      fieldErrors['fullName'] = event.errorMessage!;
    } else {
      fieldErrors.remove('fullName');
    }

    emit(state.copyWith(fullName: event.fullName, fieldErrors: fieldErrors));
  }

  void _onEmployeeIdChanged(
    EmployeeIdChanged event,
    Emitter<RegisterState> emit,
  ) {
    final fieldErrors = Map<String, String>.from(state.fieldErrors);
    if (event.employeeId.isEmpty) {
      fieldErrors['employeeId'] = event.emptyErrorMessage!;
    } else if (event.employeeId != '12345' && event.employeeId != '67890') {
      fieldErrors['employeeId'] = event.invalidErrorMessage!;
    } else {
      fieldErrors.remove('employeeId');
    }

    emit(
      state.copyWith(employeeId: event.employeeId, fieldErrors: fieldErrors),
    );
  }

  void _onUsernameChanged(UsernameChanged event, Emitter<RegisterState> emit) {
    final fieldErrors = Map<String, String>.from(state.fieldErrors);
    if (event.username.isEmpty) {
      fieldErrors['username'] = event.emptyErrorMessage!;
    } else if (event.username.toLowerCase() == 'admin' ||
        event.username.toLowerCase() == 'user') {
      fieldErrors['username'] = event.invalidErrorMessage!;
    } else {
      fieldErrors.remove('username');
    }

    emit(state.copyWith(username: event.username, fieldErrors: fieldErrors));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    final fieldErrors = Map<String, String>.from(state.fieldErrors);
    if (event.password.isEmpty) {
      fieldErrors['password'] = event.emptyErrorMessage!;
    } else if (event.password.length < 6) {
      fieldErrors['password'] = event.tooShortErrorMessage!;
    } else {
      fieldErrors.remove('password');
    }

    emit(state.copyWith(password: event.password, fieldErrors: fieldErrors));
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    final fullName = event.fullName.trim();
    final employeeId = event.employeeId.trim();
    final username = event.username.trim();
    final password = event.password.trim();

    final fieldErrors = <String, String>{};

    if (!state.isFormValid) {
      if (fullName.isEmpty) {
        fieldErrors['fullName'] = "Vui lòng nhập họ tên";
      }
      if (employeeId.isEmpty) {
        fieldErrors['employeeId'] = "Vui lòng nhập mã nhân viên";
      } else if (RegisterService.isFormatEmployeeId(employeeId)) {
        fieldErrors['employeeId'] = "Mã nhân viên không được chứa dấu cách!";
      }
      if (username.isEmpty) {
        fieldErrors['username'] = "Vui lòng nhập tài khoản";
      } else if (RegisterService.isFormatUsername(username)) {
        fieldErrors['username'] = "Tài khoản không được chứa dấu cách!";
      }
      if (password.isEmpty) {
        fieldErrors['password'] = "Vui lòng nhập mật khẩu";
      } else if (password.length < 6) {
        fieldErrors['password'] = "Mật khẩu trên 6 ký tự";
      }

      if (fieldErrors.isNotEmpty) {
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            fieldErrors: fieldErrors,
            errorMessage: '',
          ),
        );
        return;
      }
    }

    emit(
      state.copyWith(
        status: RegisterStatus.loading,
        fullName: fullName,
        employeeId: employeeId,
        username: username,
        password: '',
      ),
    );

    try {
      final errorMessage = await RegisterService.registerAuth(
        fullName,
        employeeId,
        username,
        password,
      );

      if (errorMessage == null) {
        emit(
          state.copyWith(
            status: RegisterStatus.success,
            fullName: fullName,
            employeeId: employeeId,
            username: username,
            password: '',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            errorMessage: errorMessage,
            fieldErrors: const <String, String>{},
            password: '', // Clear password for security
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: 'Đăng ký thất bại. Vui lòng thử lại.',
          password: '',
        ),
      );
    }
  }

  void _onBackToLoginPressed(
    BackToLoginPressed event,
    Emitter<RegisterState> emit,
  ) {
    // Navigation will be handled in the UI layer
    emit(state.copyWith(status: RegisterStatus.initial));
  }
}
