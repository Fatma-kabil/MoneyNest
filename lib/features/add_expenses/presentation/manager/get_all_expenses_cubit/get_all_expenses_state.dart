part of 'get_all_expenses_cubit.dart';

@immutable
sealed class GetAllExpensesState {}

final class GetAllExpensesInitial extends GetAllExpensesState {}

class GetAllExpensesLoading extends GetAllExpensesState {}

class GetAllExpensesSuccess extends GetAllExpensesState {
  final List<ExpenceEnitiy> expenses;

  GetAllExpensesSuccess(this.expenses);
}

class GetAllExpensesFailure extends GetAllExpensesState {
  final String errorMessage;

  GetAllExpensesFailure(this.errorMessage);
}

