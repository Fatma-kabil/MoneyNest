import 'package:flutter/material.dart';
import 'package:money_nest/features/add_expenses/domain/entites/category_entity.dart';


class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.totalExpenses,
    required super.icon,
    required super.color,
  });

  /// 🟢 تحويل من Map (Firestore) إلى كائن Dart
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      totalExpenses: (map['totalExpenses'] as num).toDouble(),
      icon: IconData(
        map['iconCodePoint'], // الرقم المحفوظ
        fontFamily: 'MaterialIcons', // لازم نحدده
      ),
      color: Color(map['colorValue']),
    );
  }

  /// 🔵 تحويل من كائن Dart إلى Map عشان نحفظه في Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'totalExpenses': totalExpenses,
      'iconCodePoint': icon.codePoint, // نحفظ كرقم
      'colorValue': color.value, // نحفظ كرقم
    };
  }
}
