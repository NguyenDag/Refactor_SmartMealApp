import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/screens/statistic/widgets/statistic_view.dart';

import '../../blocs/meal/statistic/statistic_bloc.dart';
import '../../blocs/meal/statistic/statistic_event.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              StatisticBloc()
                ..add(LoadStatistic(DateTime.now().month, DateTime.now().year)),
      child: const StatisticView(),
    );
  }
}
