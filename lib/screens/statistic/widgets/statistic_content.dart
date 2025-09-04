import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/screens/statistic/widgets/statistic_table.dart';
import 'package:smart_meal/screens/statistic/widgets/total_amount_display.dart';

import '../../../blocs/meal/statistic/statistic_bloc.dart';
import '../../../blocs/meal/statistic/statistic_state.dart';
import '../../../constants/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class StatisticContent extends StatelessWidget {
  const StatisticContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<StatisticBloc, StatisticState>(
        builder: (context, state) {
          if (state is StatisticLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StatisticError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(state.message),
                ],
              ),
            );
          } else if (state is StatisticLoaded) {
            return Column(
              children: [
                StatisticTable(statistics: state.statistics),
                TotalAmountDisplay(totalAmount: state.totalAmount),
              ],
            );
          }

          return NoDataDisplay();
        },
      ),
    );
  }
}

class NoDataDisplay extends StatelessWidget {
  const NoDataDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Center(child: Text(l10n.noData));
  }
}
