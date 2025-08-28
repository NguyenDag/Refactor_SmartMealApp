import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/register/register_bloc.dart';
import '../blocs/auth/register/register_event.dart';
import '../blocs/auth/register/register_state.dart';
import '../constants/app_colors.dart';
import '../l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: const RegisterView(),
    );
  }
}

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
              Navigator.of(context).pop();
            });
          } else if (state.status == RegisterStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.failRegister),
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
                              Navigator.of(context).pop();
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
                    Transform.translate(
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
                                  // Full Name Field
                                  _buildTextField(
                                    controller: _fullNameController,
                                    placeholder: l10n.fullName,
                                    errorText: state.fieldErrors['fullName'],
                                    onChanged: (value) {
                                      context.read<RegisterBloc>().add(
                                        FullNameChanged(
                                          value,
                                          errorMessage:
                                              value.isEmpty
                                                  ? l10n.fullNameBlank
                                                  : null,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  // Employee ID Field
                                  _buildTextField(
                                    controller: _employeeIdController,
                                    placeholder: l10n.employeeId,
                                    errorText: state.fieldErrors['employeeId'],
                                    onChanged: (value) {
                                      context.read<RegisterBloc>().add(
                                        EmployeeIdChanged(
                                          value,
                                          emptyErrorMessage:
                                              l10n.employeeIdBlank,
                                          invalidErrorMessage:
                                              l10n.employeeIdInvalid,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  // Username Field
                                  _buildTextField(
                                    controller: _usernameController,
                                    placeholder: l10n.accountName,
                                    errorText: state.fieldErrors['username'],
                                    onChanged: (value) {
                                      context.read<RegisterBloc>().add(
                                        UsernameChanged(
                                          value,
                                          emptyErrorMessage: l10n.usernameBlank,
                                          invalidErrorMessage:
                                              l10n.usernameInvalid,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  // Password Field
                                  _buildTextField(
                                    controller: _passwordController,
                                    placeholder: l10n.password,
                                    isPassword: true,
                                    errorText: state.fieldErrors['password'],
                                    onChanged: (value) {
                                      context.read<RegisterBloc>().add(
                                        PasswordChanged(
                                          value,
                                          emptyErrorMessage: l10n.passwordBlank,
                                          tooShortErrorMessage:
                                              l10n.passwordTooShort,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 32),
                                  // Register Button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed:
                                          state.status == RegisterStatus.loading
                                              ? null
                                              : () {
                                                context
                                                    .read<RegisterBloc>()
                                                    .add(
                                                      const RegisterSubmitted(),
                                                    );
                                              },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primaryButton,
                                        foregroundColor: AppColors.onPrimary,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child:
                                          state.status == RegisterStatus.loading
                                              ? const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                        Color
                                                      >(AppColors.white),
                                                ),
                                              )
                                              : Text(
                                                l10n.register,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String placeholder,
    required Function(String) onChanged,
    String? errorText,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: AppColors.placeholderText,
              fontSize: 12,
            ),
            filled: true,
            fillColor: AppColors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color:
                    errorText != null ? AppColors.error : AppColors.blackBorder,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color:
                    errorText != null ? AppColors.error : AppColors.blackBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color:
                    errorText != null
                        ? AppColors.error
                        : AppColors.successBorder,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
          ),
          style: const TextStyle(fontSize: 16, color: AppColors.textPrimary),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              errorText,
              style: const TextStyle(color: AppColors.error, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
