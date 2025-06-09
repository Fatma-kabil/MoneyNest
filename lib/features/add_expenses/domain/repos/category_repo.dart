
import 'package:money_nest/features/add_expenses/domain/entites/category_entity.dart';

abstract class CategoryRepo {
  Future<void> createCategory(CategoryEntity categorty);
  Future<List<CategoryEntity>> getAllCategories(); 
}
