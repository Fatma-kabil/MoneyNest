import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_nest/features/add_expenses/domain/entites/expence_enitiy.dart';
import 'package:money_nest/features/add_expenses/domain/repos/expense_repo.dart';

part 'get_all_expenses_state.dart';

class GetAllExpensesCubit extends Cubit<GetAllExpensesState> {
  final ExpenseRepo expenseRepo;
  GetAllExpensesCubit(this.expenseRepo) : super(GetAllExpensesInitial());

  Future<List<ExpenceEnitiy>> get_all_expenses() async {
    emit(GetAllExpensesLoading());
    try {
      final List<ExpenceEnitiy> expenses = await expenseRepo.get_all_expenses();
      emit(GetAllExpensesSuccess(expenses));
      return expenses;
    } catch (e) {
      emit(GetAllExpensesFailure(e.toString()));
      return [];
    }
  }
}
