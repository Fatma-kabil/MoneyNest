import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_nest/features/add_expenses/domain/entites/category_entity.dart';
import 'package:money_nest/features/add_expenses/domain/repos/category_repo.dart';


part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  final CategoryRepo categoryRepo;
  GetAllCategoriesCubit(this.categoryRepo) : super(GetAllCategoriesInitial());

  Future<List<CategoryEntity>> get_all_categories() async {
  emit(GetAllCategoriesLoading());
  try {
    final List<CategoryEntity> categories = await categoryRepo.getAllCategories();
    emit(GetAllCategoriesSuccess(categories));
    return categories;
  } catch (e) {
    emit(GetAllCategoriesFailure(e.toString()));
    return [];
  }
}

}
