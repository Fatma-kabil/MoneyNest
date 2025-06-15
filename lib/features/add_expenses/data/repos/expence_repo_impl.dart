import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_nest/features/add_expenses/data/models/expense_model.dart';
import 'package:money_nest/features/add_expenses/domain/entites/expence_enitiy.dart';
import 'package:money_nest/features/add_expenses/domain/repos/expense_repo.dart';

class ExpenseRepoImpl extends ExpenseRepo {
  final CollectionReference expensesCollection =
      FirebaseFirestore.instance.collection('Expenses');

  @override
  Future<void> createExpense(ExpenceEnitiy expense) async {
    try {
      final model = ExpenseModel(
        id: expense.id,
        amount: expense.amount,
        category: expense.category,
        date: expense.date,
      );

      await expensesCollection.doc(model.id).set(model.toMap());
    } catch (e) {
      log('❌ Error in createExpense: $e');
      rethrow;
    }
  }

  @override
  Future<List<ExpenceEnitiy>> get_all_expenses() async {
    try {
      final snapshot = await expensesCollection.get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ExpenseModel.fromMap(data);
      }).toList();
    } catch (e) {
      log('❌ Error in getAllExpenses: $e');
      rethrow;
    }
  }
}
