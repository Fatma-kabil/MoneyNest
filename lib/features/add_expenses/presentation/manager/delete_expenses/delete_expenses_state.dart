// delete_expenses_state.dart
part of 'delete_expenses_cubit.dart';

abstract class DeleteExpensesState {}

class DeleteExpensesInitial extends DeleteExpensesState {}

class DeleteExpensesLoading extends DeleteExpensesState {}

class DeleteExpensesSuccess extends DeleteExpensesState {}

class DeleteExpensesFailure extends DeleteExpensesState {
  final String error;

  DeleteExpensesFailure(this.error);
}
