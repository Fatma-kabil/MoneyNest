import 'package:money_nest/features/add_expenses/domain/entites/category_entity.dart';

class ExpenceEnitiy {
  final String id;
  final CategoryEntity category;
  final DateTime date;
  final double amount;

  ExpenceEnitiy({
    required this.id,
    required this.category,
    required this.date,
    required this.amount,
  });
}
