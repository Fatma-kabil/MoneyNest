import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_nest/features/add_expenses/domain/entites/category_entity.dart';
import 'package:money_nest/features/add_expenses/domain/repos/category_repo.dart';

part 'create_category_state.dart';

class CreateCategoryCubit extends Cubit<CreateCategoryState> {
  final CategoryRepo categoryRepo;

  CreateCategoryCubit(this.categoryRepo) : super(CreateCategoryInitial());

  Future<void> createCategory(CategoryEntity category) async {
    emit(CreateCategoryLoading());
    try {
      await categoryRepo.createCategory(category);
      emit(CreateCategorySuccess());
    } catch (e) {
      emit(CreateCategoryFailure(e.toString()));
    }
  }
}
