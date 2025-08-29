import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/common/custom_text_field.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController employeeIdController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  final String? fullNameError;
  final String? employeeIdError;
  final String? usernameError;
  final String? passwordError;

  const RegisterForm({
    super.key,
    required this.fullNameController,
    required this.employeeIdController,
    required this.usernameController,
    required this.passwordController,
    this.fullNameError,
    this.employeeIdError,
    this.usernameError,
    this.passwordError,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        CustomTextField(
          controller: fullNameController,
          placeholder: l10n.fullName,
          isPassword: false,
          errorText: fullNameError,
        ),

        const SizedBox(height: 16),

        CustomTextField(
          controller: employeeIdController,
          placeholder: l10n.employeeId,
          isPassword: false,
          errorText: employeeIdError,
        ),

        const SizedBox(height: 16),

        CustomTextField(
          controller: usernameController,
          placeholder: l10n.accountName,
          isPassword: false,
          errorText: usernameError,
        ),

        const SizedBox(height: 16),

        CustomTextField(
          controller: passwordController,
          placeholder: l10n.password,
          isPassword: true,
          errorText: passwordError,
        ),
      ],
    );
  }
}
