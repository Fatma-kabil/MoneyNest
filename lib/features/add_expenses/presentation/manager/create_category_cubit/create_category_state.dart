part of 'create_category_cubit.dart';

@immutable
sealed class CreateCategoryState {}

final class CreateCategoryInitial extends CreateCategoryState {}
final class CreateCategoryFailure extends CreateCategoryState {
  final String errorMessage;

  CreateCategoryFailure(this.errorMessage);
}

final class CreateCategoryLoading extends CreateCategoryState {}
final class CreateCategorySuccess extends CreateCategoryState {}
