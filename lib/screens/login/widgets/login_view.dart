import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/login/login_bloc.dart';
import '../../../blocs/auth/login/login_event.dart';
import '../../../blocs/auth/login/login_state.dart';
import '../../../constants/app_routes.dart';
import 'login_card.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginButtonPressed() {
    context.read<LoginBloc>().add(
      LoginSubmitted(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: LoginCard(
                  usernameController: _usernameController,
                  passwordController: _passwordController,
                  onLoginPressed: _onLoginButtonPressed,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}