import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/features/add_expenses/domain/entites/expence_enitiy.dart';
import 'chart_data_helper.dart';

class MyChart extends StatelessWidget {
  final List<ExpenceEnitiy> expenses;

  const MyChart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    final chartData = ChartDataHelper.fromExpenses(expenses, context);

    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 1600,
        barGroups: chartData.groups,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          drawHorizontalLine: true,
          horizontalInterval: 100,
          getDrawingHorizontalLine: (value) {
            if (value >= 100 && value <= 1500) {
              return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
            }
            return FlLine(strokeWidth: 0);
          },
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < chartData.keys.length) {
                  return Text(
                    chartData.keys[index],
                    style: const TextStyle(fontSize: 12),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              getTitlesWidget: (value, meta) {
                if (value % 100 == 0 && value >= 100 && value <= 1500) {
                  return Text(
                    '${value.toInt()}',
                    style: const TextStyle(fontSize: 12),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
