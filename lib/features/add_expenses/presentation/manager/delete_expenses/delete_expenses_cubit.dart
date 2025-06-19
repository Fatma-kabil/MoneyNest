import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/features/add_expenses/domain/repos/expense_repo.dart';

part 'delete_expenses_state.dart';

class DeleteExpensesCubit extends Cubit<DeleteExpensesState> {
  final ExpenseRepo expenseRepo;

  DeleteExpensesCubit(this.expenseRepo) : super(DeleteExpensesInitial());

  Future<void> deleteExpenses(List<String> ids) async {
    emit(DeleteExpensesLoading());
    try {
      await expenseRepo.deleteExpenses(ids);
      emit(DeleteExpensesSuccess());
    } catch (e) {
      emit(DeleteExpensesFailure(e.toString()));
    }
  }
}
