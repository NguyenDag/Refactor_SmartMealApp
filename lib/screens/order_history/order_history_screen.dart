import 'package:flutter/material.dart';
import 'package:smart_meal/screens/order_history/widgets/order_history_header.dart';
import 'package:smart_meal/screens/order_history/widgets/order_history_table.dart';
import '../../constants/app_colors.dart';
import '../../models/order_history_model.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_app_drawer.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final List<OrderHistory> orderHistory = List.generate(
    30,
    (index) => OrderHistory(
      id: index + 1,
      dishName:
          ['Cơm gà', 'Miến xào', 'Cơm trộn', 'Mỳ xào', 'Cơm tấm'][index % 5],
      supplyDate: ['4/8/2025', '3/8/2025', '1/8/2025', '30/7/2025'][index % 4],
      status: 'Đã đặt',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        appBar: const CustomAppBar(),
        endDrawer: CustomAppDrawer(),
        body: Column(
          children: [
            // Header với icon lịch sử và tiêu đề
            OrderHistoryHeader(),

            const SizedBox(height: 8),

            Divider(thickness: 1, color: AppColors.primaryDivider),

            const SizedBox(height: 8),

            Expanded(child: OrderHistoryTable(orderHistory: orderHistory)),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}