import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_nest/features/add_expenses/domain/entites/expence_enitiy.dart';
import 'package:money_nest/features/add_expenses/domain/repos/expense_repo.dart';

part 'create_expenses_state.dart';

class CreateExpensesCubit extends Cubit<CreateExpensesState> {
  CreateExpensesCubit(this.expenseRepo) : super(CreateExpensesInitial());
  final ExpenseRepo expenseRepo;
  Future<void> CreateExpenses(ExpenceEnitiy expence) async {
    emit(CreateExpensesLoading());
    try {
      await expenseRepo.createExpense(expence);
      emit(CreateExpensesSuccess());
    } catch (e) {
      emit(CreateExpensesFaiure(errMess: e.toString()));
    }
  }
}
