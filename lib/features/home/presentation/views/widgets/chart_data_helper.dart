import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:money_nest/features/add_expenses/domain/entites/expence_enitiy.dart';

class ChartDataHelper {
  final List<BarChartGroupData> groups;
  final List<String> keys;

  ChartDataHelper({required this.groups, required this.keys});

  static BarChartGroupData makeGroupData({
    required int x,
    required double y,
    required BuildContext context,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 10,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 4),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5, // 👈 العمود الرمادي ثابت لحد 5
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  static ChartDataHelper fromExpenses(
      List<ExpenceEnitiy> expenses, BuildContext context) {
    final Map<String, double> dailyTotals = {};

    for (var expense in expenses) {
      final day = DateFormat('dd/MM').format(expense.date);
      dailyTotals[day] = (dailyTotals[day] ?? 0) + expense.amount;
    }

    final keys = dailyTotals.keys.toList();

    final groups = List.generate(keys.length, (index) {
      final amount = dailyTotals[keys[index]]!;
      return makeGroupData(x: index, y: amount, context: context);
    });

    return ChartDataHelper(groups: groups, keys: keys);
  }
}
