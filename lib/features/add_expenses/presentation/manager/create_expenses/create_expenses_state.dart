part of 'create_expenses_cubit.dart';

@immutable
sealed class CreateExpensesState {}

final class CreateExpensesInitial extends CreateExpensesState {}

final class CreateExpensesLoading extends CreateExpensesState {}

final class CreateExpensesSuccess extends CreateExpensesState {}

final class CreateExpensesFaiure extends CreateExpensesState {
  final String errMess;

  CreateExpensesFaiure({required this.errMess});
}
