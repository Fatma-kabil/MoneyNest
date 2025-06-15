import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/get_all_categories_cubit/get_all_categories_cubit.dart';

class GetAllCategories extends StatelessWidget {
  const GetAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,

            ///   vertical: 8,
          ),
          child: BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
            builder: (context, state) {
              if (state is GetAllCategoriesSuccess) {
                return ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(state.categories[index].icon, size: 25),
                        title: Text(
                          state.categories[index].name,
                          style: AppStyles.userNameText.copyWith(fontSize: 16),
                        ),
                        //  dense: true,
                        tileColor: state.categories[index].color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.grey),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
