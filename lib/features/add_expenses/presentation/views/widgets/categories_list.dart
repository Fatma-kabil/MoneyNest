import 'package:flutter/material.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_form_field.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 180, 209, 212),
      title: Text('Create a Category'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          CustomTextFormField(width: 0.9, borderRedius: 10, hint: "Name"),
          SizedBox(height: 20),
          CustomTextFormField(width: 0.9, borderRedius: 10, hint: "Icon"),
          SizedBox(height: 20),
          CustomTextFormField(width: 0.9, borderRedius: 10, hint: "Color"),
        ],
      ),
    );
  }
}
