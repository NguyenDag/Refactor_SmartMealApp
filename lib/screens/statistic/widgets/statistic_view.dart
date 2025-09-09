import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/screens/statistic/widgets/statistic_content.dart';
import 'package:smart_meal/screens/statistic/widgets/statistic_header.dart';

import '../../../blocs/meal/statistic/statistic_bloc.dart';
import '../../../blocs/meal/statistic/statistic_event.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/common/custom_app_bar.dart';
import '../../../widgets/common/custom_app_drawer.dart';

class StatisticView extends StatefulWidget {
  const StatisticView({super.key});

  @override
  State<StatefulWidget> createState() => _StatisticViewState();
}

class _StatisticViewState extends State<StatisticView> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  void _onSearchPressed() {
    context.read<StatisticBloc>().add(
      SearchStatistic(selectedMonth, selectedYear),
    );
  }

  void _onMonthChanged(int? month) {
    if (month != null) {
      setState(() {
        selectedMonth = month;
      });
    }
  }

  void _onYearChanged(int? year) {
    if (year != null) {
      setState(() {
        selectedYear = year;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CustomAppBar(),
        endDrawer: CustomAppDrawer(),
        body: Column(
          children: [
            StatisticHeader(
              selectedMonth: selectedMonth,
              selectedYear: selectedYear,
              onMonthChanged: _onMonthChanged,
              onYearChanged: _onYearChanged,
              onSearchPressed: _onSearchPressed,
            ),

            Expanded(child: StatisticContent()),
          ],
        ),
      ),
    );
  }
}
