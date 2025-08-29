import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/screens/register/widgets/register_view.dart';

import '../../blocs/auth/register/register_bloc.dart';

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
