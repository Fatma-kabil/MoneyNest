import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/features/add_expenses/domain/entites/category_entity.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/get_all_categories_cubit/get_all_categories_cubit.dart';
class GetAllCategories extends StatelessWidget {
  const GetAllCategories({super.key, required this.onCategorySelected});
  final Function(CategoryEntity) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
      builder: (context, state) {
        if (state is GetAllCategoriesSuccess) {
          if (state.categories.isEmpty) {
            return const SizedBox.shrink(); // لا تعرض أي شيء
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return Card(
                      child: ListTile(
                        onTap: () => onCategorySelected(category),
                        leading: Icon(category.icon, size: 25),
                        title: Text(
                          category.name,
                          style: AppStyles.userNameText.copyWith(fontSize: 16),
                        ),
                        tileColor: category.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is GetAllCategoriesLoading) {
          return const Center(child: CircularProgressIndicator(color: Colors.grey));
        } else {
          return const SizedBox.shrink(); // لا تعرض شيء في الحالات الأخرى
        }
      },
    );
  }
}
