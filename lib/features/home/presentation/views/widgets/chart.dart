import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/core/utils/functions/bottom_titles.dart';
import 'package:money_nest/core/utils/functions/left_titles_fun.dart';
import 'chart_data_helper.dart'; // الكلاس اللي عملناه

class MyChart extends StatelessWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(_mainBarData(context));
  }

  BarChartData _mainBarData(BuildContext context) {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 33,
            getTitlesWidget: bottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 33,
            getTitlesWidget: leftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
      barGroups: ChartDataHelper.showingGroups(context),
    );
  }
}
