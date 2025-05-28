import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ChartDataHelper {
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
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  static List<BarChartGroupData> showingGroups(BuildContext context) =>
      List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(x: 0, y: 2, context: context);
          case 1:
            return makeGroupData(x: 1, y: 3, context: context);
          case 2:
            return makeGroupData(x: 2, y: 2, context: context);
          case 3:
            return makeGroupData(x: 3, y: 4.5, context: context);
          case 4:
            return makeGroupData(x: 4, y: 3.8, context: context);
          case 5:
            return makeGroupData(x: 5, y: 1.5, context: context);
          case 6:
            return makeGroupData(x: 6, y: 4, context: context);
          case 7:
            return makeGroupData(x: 7, y: 3.8, context: context);
          default:
            throw Error();
        }
      });
}
