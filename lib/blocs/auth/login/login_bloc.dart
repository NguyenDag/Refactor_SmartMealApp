import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote/login_service.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginReset>(_onLoginReset);
    on<LoginUsernameChanged>(_onLoginUsernameChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<UsernameLoaded>(_onUsernameLoaded);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final username = event.username.trim();
    final password = event.password.trim();

    // Validate fields
    String? usernameError;
    String? passwordError;

    if (username.isEmpty) {
      usernameError = 'Vui lòng nhập tên đăng nhập';
    }

    if (password.isEmpty) {
      passwordError = 'Vui lòng nhập mật khẩu';
    }

    if (usernameError != null || passwordError != null) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          username: username,
          password: password,
          usernameError: usernameError,
          passwordError: passwordError,
        ),
      );
      return;
    }

    emit(state.copyWith(status: LoginStatus.loading));

    try {
      final errorMessage = await LoginService.loginAuth(username, password);

      //login success
      if (errorMessage == null) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            generalError: errorMessage,
            usernameError: null,
            passwordError: null,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          generalError: "Có lỗi xảy ra. Vui lòng thử lại.",
          usernameError: null,
          passwordError: null,
        ),
      );
    }
  }

  void _onLoginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(state.copyWith(status: LoginStatus.initial));
  }

  void _onLoginUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = event.username.trim();
    String? usernameError;
    if (username.isEmpty) {
      usernameError = 'Vui lòng nhập tên đăng nhập';
    }
    emit(
      state.copyWith(
        username: username,
        usernameError: usernameError,
        generalError: null,
      ),
    );
  }

  void _onLoginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = event.password.trim();
    String? passwordError;
    if (password.isEmpty) {
      passwordError = 'Vui lòng nhập mật khẩu';
    }
    emit(
      state.copyWith(
        password: password,
        passwordError: passwordError,
        generalError: null,
      ),
    );
  }

  // lấy thông tin account được lưu trong SharedPreferences
  void _onUsernameLoaded(UsernameLoaded event, Emitter<LoginState> emit) {
    emit(state.copyWith(status: LoginStatus.initial));
  }
}
