part of 'get_all_categories_cubit.dart';

@immutable
sealed class GetAllCategoriesState {}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}
class GetAllCategoriesLoading extends GetAllCategoriesState {}

class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final List<CategoryEntity> categories;

  GetAllCategoriesSuccess(this.categories);
}

class GetAllCategoriesFailure extends GetAllCategoriesState {
  final String errorMessage;

  GetAllCategoriesFailure(this.errorMessage);
}

