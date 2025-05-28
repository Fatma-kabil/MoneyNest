import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget leftTitles(double value, TitleMeta meta) {
  // تجاهل القيم غير الصحيحة (العشرية)
  if (value % 1 != 0) return const SizedBox.shrink();

  // تحديد النص بناءً على القيمة
  String label = '\$${value.toInt()}K';

  return SideTitleWidget(
    space: 8,
    meta: meta,
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    ),
  );
}
