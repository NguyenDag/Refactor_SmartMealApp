import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_routes.dart';
import '../../../l10n/app_localizations.dart';

class LoginActions extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onLoginPressed;

  const LoginActions({
    super.key,
    required this.isLoading,
    required this.onLoginPressed,
  });

  void _navigateToForgotPassword(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.forgotPassword);
  }

  void _navigateToCreateAccount(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Login button
        LoginButton(isLoading: isLoading, onPressed: onLoginPressed),
        const SizedBox(height: 16),

        // Forgot password link
        TextButton(
          onPressed: () => _navigateToForgotPassword(context),
          child: Text(
            l10n.forgotPassword,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),

        Divider(color: AppColors.primaryDivider, thickness: 1),
        const SizedBox(height: 8),

        // Create account button
        CreateAccountButton(onPressed: () => _navigateToCreateAccount(context)),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryButton,
          foregroundColor: AppColors.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child:
            isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.secondaryBackground,
                    ),
                  ),
                )
                : Text(
                  l10n.login,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateAccountButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return FractionallySizedBox(
      widthFactor: 0.82,
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryButton,
            foregroundColor: AppColors.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Text(
            l10n.createAccount,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
