import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/constants/app_routes.dart';
import 'package:smart_meal/screens/register/widgets/register_card.dart';

import '../../../blocs/auth/register/register_bloc.dart';
import '../../../blocs/auth/register/register_event.dart';
import '../../../blocs/auth/register/register_state.dart';
import '../../../constants/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _fullNameController = TextEditingController();
  final _employeeIdController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _employeeIdController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onRegisterButtonPressed() {
    context.read<RegisterBloc>().add(
      RegisterSubmitted(
        fullName: _fullNameController.text,
        employeeId: _employeeIdController.text,
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final l10n = AppLocalizations.of(context);
          if (state.status == RegisterStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.successRegister),
                backgroundColor: AppColors.success,
              ),
            );
            // Navigate back to login after success
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
              }
            });
          } else if (state.status == RegisterStatus.failure &&
              state.errorMessage != '') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: Stack(
          children: [
            // Background image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image_register.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Content
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Back button
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<RegisterBloc>().add(
                                const BackToLoginPressed(),
                              );
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.login,
                                (route) => false,
                              );
                            },
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.onPrimary,
                                    size: 16,
                                  ),
                                  Text(
                                    l10n.comeBack,
                                    style: const TextStyle(
                                      color: AppColors.onPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Form container
                    RegisterCard(
                      fullNameController: _fullNameController,
                      employeeIdController: _employeeIdController,
                      usernameController: _usernameController,
                      passwordController: _passwordController,
                      onLoginPressed: _onRegisterButtonPressed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
