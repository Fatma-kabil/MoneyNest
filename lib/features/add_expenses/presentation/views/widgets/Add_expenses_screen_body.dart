import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/core/utils/widgets/show_custom_snackbar.dart';
import 'package:money_nest/features/add_expenses/data/models/expense_model.dart';
import 'package:money_nest/features/add_expenses/domain/entites/category_entity.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/create_category_cubit/create_category_cubit.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/create_expenses/create_expenses_cubit.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/categories_list.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_form_field.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/get_all_categories.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_button.dart';

class AddExpensesScreenBody extends StatefulWidget {
  const AddExpensesScreenBody({super.key});

  @override
  State<AddExpensesScreenBody> createState() => _AddExpensesScreenBodyState();
}

class _AddExpensesScreenBodyState extends State<AddExpensesScreenBody> {
  final TextEditingController expensesController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  CategoryEntity? selectedCategory;

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat("dd/MM/yyyy").format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateExpensesCubit, CreateExpensesState>(
      listener: (context, state) {
        if (state is CreateExpensesSuccess) {
          expensesController.clear();
          categoryController.clear();
          dateController.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
          selectedCategory = null;

          //  Navigator.pop(context);
          showCustomSnackBar(
            context: context,
            message: "Expense created successfully",
            isSuccess: true,
          );
        } else if (state is CreateExpensesFaiure) {
          showCustomSnackBar(
            context: context,
            message: "Failed to create Expense",
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Add Expenses', style: AppStyles.textMeduim20),
                const SizedBox(height: 16),

                // Amount Field
                CustomTextFormField(
                  borderRadius: BorderRadius.circular(30),
                  controller: expensesController,
                  width: 0.7,
                  prefxIcon: CupertinoIcons.money_dollar,
                  //   keyboardType: TextInputType.numberWithOptions(decimal: true),
                  hint: 'Amount',
                ),

                const SizedBox(height: 32),

                // Category Field
                CustomTextFormField(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  readOnly: true,
                  controller: categoryController,
                  width: 0.9,
                  filledColor: selectedCategory?.color ?? Colors.white,
                  prefxIcon: selectedCategory?.icon ?? Icons.list,
                  prefixIconColor: selectedCategory != null
                      ? Colors.black
                      : Colors.grey,
                  style: categoryController.text.isEmpty
                      ? null
                      : AppStyles.userNameText.copyWith(fontSize: 16),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                value: context.read<CreateCategoryCubit>(),
                              ),
                              BlocProvider.value(
                                value: context.read<GetAllCategoriesCubit>(),
                              ),
                            ],
                            child: const CategoriesList(),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                  hint: selectedCategory?.name ?? 'Categories',
                ),

                GetAllCategories(
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                      categoryController.text = category.name;
                    });
                  },
                ),

                const SizedBox(height: 16),

                // Date Field
                CustomTextFormField(
                  borderRadius: BorderRadius.circular(10),
                  controller: dateController,
                  width: 0.9,
                  prefxIcon: Icons.date_range_outlined,
                  hint: 'Date',
                  ontap: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (newDate != null) {
                      setState(() {
                        selectedDate = newDate;
                        dateController.text = DateFormat(
                          "dd/MM/yyyy",
                        ).format(newDate);
                      });
                    }
                  },
                ),

                const SizedBox(height: 32),

                if (state is CreateExpensesLoading)
                  const CircularProgressIndicator(color: Colors.grey)
                else
                  CustomTextButton(
                    onPressed: () {
                      final amountText = expensesController.text.trim();
                      final category = selectedCategory;
                      final date = selectedDate;

                      if (amountText.isEmpty || category == null) {
                        showCustomSnackBar(
                          context: context,
                          message: "Please fill all fields",
                        );
                        return;
                      }

                      final amount = double.tryParse(amountText);
                      if (amount == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid amount")),
                        );
                        return;
                      }

                      final expense = ExpenseModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        amount: amount,
                        date: date,
                        category: category,
                      );

                      context.read<CreateExpensesCubit>().CreateExpenses(
                        expense,
                      );

                      log('amount: $amount');
                      log('category: ${category.name}');
                      log('date: $date');
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
