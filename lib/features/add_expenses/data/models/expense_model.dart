import 'package:money_nest/features/add_expenses/domain/entites/expence_enitiy.dart';
import 'category_model.dart'; // لو عندك CategoryModel منفصل
class ExpenseModel extends ExpenceEnitiy {
  ExpenseModel({
    required super.id,
    required super.category,
    required super.date,
    required super.amount,
    required super.userId, // ✅
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      amount: (map['amount'] as num).toDouble(),
      date: DateTime.parse(map['date']),
      category: CategoryModel.fromMap(map['category']),
      userId: map['userId'], // ✅
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': (category as CategoryModel).toMap(),
      'userId': userId, // ✅
    };
  }
}
