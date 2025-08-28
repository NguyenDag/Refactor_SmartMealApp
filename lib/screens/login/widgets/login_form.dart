import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../widgets/common/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String? usernameError;
  final String? passwordError;

  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
    this.usernameError,
    this.passwordError,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        CustomTextField(
          controller: usernameController,
          placeholder: l10n.placeholderUsername,
          isPassword: false,
          errorText: usernameError,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: passwordController,
          placeholder: l10n.placeholderPassword,
          isPassword: true,
          errorText: passwordError,
        ),
      ],
    );
  }
}
