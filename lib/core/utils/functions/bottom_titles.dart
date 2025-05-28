import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitles(double value, TitleMeta meta) {
  const labels = ['01', '02', '03', '04', '05', '06', '07', '08'];

  return SideTitleWidget(
    space: 12,
    meta: meta,
    child: Text(
      value.toInt() < labels.length ? labels[value.toInt()] : '',
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    ),
  );
}
