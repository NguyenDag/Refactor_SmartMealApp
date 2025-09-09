import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/blocs/meal/order_history/order_history_bloc.dart';
import 'package:smart_meal/screens/order_history/widgets/order_history_view.dart';
import '../../blocs/meal/order_history/order_history_event.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderHistoryBloc()..add(LoadOrderHistory()),
      child: const OrderHistoryView(),
    );
  }
}
