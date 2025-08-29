import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/screens/register/widgets/register_button.dart';
import 'package:smart_meal/screens/register/widgets/register_form.dart';

import '../../../blocs/auth/register/register_bloc.dart';
import '../../../blocs/auth/register/register_state.dart';
import '../../../constants/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class RegisterCard extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController employeeIdController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;

  const RegisterCard({
    super.key,
    required this.fullNameController,
    required this.employeeIdController,
    required this.usernameController,
    required this.passwordController,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadow,
              blurRadius: 30,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              final l10n = AppLocalizations.of(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      l10n.createAccount,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textTitle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Divider(
                    color: AppColors.secondaryDivider,
                    thickness: 1,
                  ),
                  const SizedBox(height: 18),
                  RegisterForm(
                    fullNameController: fullNameController,
                    employeeIdController: employeeIdController,
                    usernameController: usernameController,
                    passwordController: passwordController,
                    fullNameError: state.fieldErrors['fullName'],
                    employeeIdError: state.fieldErrors['employeeId'],
                    usernameError: state.fieldErrors['username'],
                    passwordError: state.fieldErrors['password'],
                  ),
                  const SizedBox(height: 32),
                  // Register Button
                  RegisterButton(
                    isLoading: state.status == RegisterStatus.loading,
                    onPressed: onLoginPressed,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}