import 'package:flutter/material.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/Add_expenses_screen_body.dart';

class AddExpensesScreen extends StatelessWidget {
  const AddExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
           backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: AddExpensesScreenBody(),
      ),
    );
  }
}
