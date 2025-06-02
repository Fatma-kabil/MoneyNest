import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/app_style.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Add Expenses', style: AppStyles.textMeduim20),
          SizedBox(height: 16),
          CustomTextFormField(
            width: 0.7,
            borderRedius: 30,
            icon: CupertinoIcons.money_dollar,
          ),
          SizedBox(height: 32),
          CustomTextFormField(
            width: 0.9,
            borderRedius: 10,
            icon: Icons.list,
            hint: 'Categories',
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            width: 0.9,
            borderRedius: 10,
            icon: Icons.date_range_outlined,
            hint: 'Date',
            ontap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
              );
            },
          ),
          SizedBox(height: 32),
          CustomTextButton(),
        ],
      ),
    );
  }
}
