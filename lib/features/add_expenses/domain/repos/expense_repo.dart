import 'package:money_nest/features/add_expenses/domain/entites/expence_enitiy.dart';

abstract class ExpenseRepo {
  Future<void> createExpense(ExpenceEnitiy expense);
  Future<List<ExpenceEnitiy>> get_all_expenses();
}
