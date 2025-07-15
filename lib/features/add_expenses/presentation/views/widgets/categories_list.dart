import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/core/utils/widgets/show_custom_snackbar.dart';
import 'package:money_nest/features/add_expenses/data/models/category_model.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/create_category_cubit/create_category_cubit.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/categoriey_icons_grid.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_button.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_form_field.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/pick_color.dart';
import 'package:uuid/uuid.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  IconData? iconSelected;
  Color categoryColor = Colors.white;
  final TextEditingController nameController = TextEditingController();
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 180, 209, 212),
      title: const Text('Create a Category'),
      content: BlocConsumer<CreateCategoryCubit, CreateCategoryState>(
        listener: (context, state) {
          if (state is CreateCategorySuccess) {
            // ✅ Re-fetch categories after creation
            context.read<GetAllCategoriesCubit>().get_all_categories();
            Navigator.pop(context); // رجوع بعد الإنشاء
          } else if (state is CreateCategoryFailure) {
            showCustomSnackBar(
              context: context,
              message: "Failed to create Category",
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
                CustomTextFormField(
                  controller: nameController,
                  isDense: true,
                  borderRadius: BorderRadius.circular(10),
                  width: 0.9,
                  hint: "Name",
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  ontap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  isDense: true,
                  width: 0.9,
                  hint: "Icon",
                  readOnly: true,
                  suffixIcon: const Icon(CupertinoIcons.chevron_down, size: 18),
                  borderRadius: isExpanded
                      ? const BorderRadius.vertical(top: Radius.circular(10))
                      : BorderRadius.circular(10),
                ),
                if (isExpanded)
                  CategoryIconsGrid(
                    selectedIcon: iconSelected,
                    onIconSelected: (icon) {
                      setState(() {
                        iconSelected = icon;
                      });
                    },
                  ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  filledColor: categoryColor,
                  isDense: true,
                  width: 0.9,
                  hint: "Color",
                  borderRadius: BorderRadius.circular(10),
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PickColor(
                          onColorChanged: (p0) {
                            setState(() {
                              categoryColor = p0;
                            });
                          },
                          categoryColor: categoryColor,
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                if (state is CreateCategoryLoading)
                  const CircularProgressIndicator(color: Colors.grey)
                else
                  CustomTextButton(
                    onPressed: () {
                      final name = nameController.text.trim();
                      if (iconSelected == null || name.isEmpty) {
                        showCustomSnackBar(
                          context: context,
                          message: "Please fill all fields",
                        );
                        return;
                      }

                      final category = CategoryModel(
                        id: const Uuid().v4(),
                        name: name,
                        icon: iconSelected!,
                        color: categoryColor,
                         userId: FirebaseAuth.instance.currentUser!.uid,
                        //   totalExpenses: 0,
                      );

                      context.read<CreateCategoryCubit>().createCategory(
                        category,
                      );

                      log('icon: $iconSelected');
                      log('color: $categoryColor');
                      log('name: $name');
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
