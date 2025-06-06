import 'package:flutter/material.dart';

class CategoryEntity {
  final String id;
  final String name;
  final double totalExpenses;
  final IconData icon;
  final Color color;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });
}
