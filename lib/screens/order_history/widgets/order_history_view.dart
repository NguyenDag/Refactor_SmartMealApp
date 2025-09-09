import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/meal/order_history/order_history_bloc.dart';
import '../../../blocs/meal/order_history/order_history_state.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/common/custom_app_bar.dart';
import '../../../widgets/common/custom_app_drawer.dart';
import 'order_history_header.dart';
import 'order_history_table.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        appBar: const CustomAppBar(),
        endDrawer: CustomAppDrawer(),
        body: BlocListener<OrderHistoryBloc, OrderHistoryState>(
          listener: (context, state) { },
          child: Column(
            children: [
              // Header với icon lịch sử và tiêu đề
              OrderHistoryHeader(),

              const SizedBox(height: 8),

              Divider(thickness: 1, color: AppColors.primaryDivider),

              const SizedBox(height: 8),

              Expanded(child: OrderHistoryTable()),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}