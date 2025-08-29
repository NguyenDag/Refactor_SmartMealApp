import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class RegisterButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const RegisterButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed:
            // state.status == RegisterStatus.loading
            isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryButton,
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child:
            isLoading
                ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
                : Text(
                  l10n.register,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
      ),
    );
  }
}
