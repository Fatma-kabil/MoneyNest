import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/create_category_cubit/create_category_cubit.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/categories_list.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_button.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_form_field.dart';

class AddExpensesScreenBody extends StatefulWidget {
  const AddExpensesScreenBody({super.key});

  @override
  State<AddExpensesScreenBody> createState() => _AddExpensesScreenBodyState();
}

class _AddExpensesScreenBodyState extends State<AddExpensesScreenBody> {
  TextEditingController expensesController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
    //DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add Expenses', style: AppStyles.textMeduim20),
            SizedBox(height: 16),
            CustomTextFormField(
              borderRadius: BorderRadius.circular(30),
              controller: expensesController,
              width: 0.7,

              prefxIcon: CupertinoIcons.money_dollar,
            ),
            SizedBox(height: 32),
            CustomTextFormField(
              borderRadius: BorderRadius.circular(10),
              readOnly: true,
              controller: categoryController,
              width: 0.9,

              prefxIcon: Icons.list,
              suffixIcon: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return BlocProvider.value(
                        value: context
                            .read<
                              CreateCategoryCubit
                            >(), // بيوصل الكيوبت من فوق للديالوج
                        child: CategoriesList(),
                      );
                    },
                  );
                },
                icon: Icon(Icons.add), // أو أيقونتك الحالية
              ),

              hint: 'Categories',
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              borderRadius: BorderRadius.circular(10),
              controller: dateController,
              width: 0.9,
              //  borderRedius: 10,
              prefxIcon: Icons.date_range_outlined,
              hint: 'Date',
              ontap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (newDate != null) {
                  setState(() {
                    dateController.text = DateFormat(
                      "dd/MM/yyyy",
                    ).format(newDate);
                    selectedDate = newDate;
                  });
                }
              },
            ),
            SizedBox(height: 32),
            CustomTextButton(),
          ],
        ),
      ),
    );
  }
}
