import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/get_all_expenses_cubit/get_all_expenses_cubit.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_button.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_list_view.dart';

class TransactionViewBody extends StatefulWidget {
  const TransactionViewBody({super.key});

  @override
  State<TransactionViewBody> createState() => _TransactionViewBodyState();
}

class _TransactionViewBodyState extends State<TransactionViewBody> {
  final Set<String> selectedExpenseIds = {};

  void toggleSelect(String id) {
    setState(() {
      if (selectedExpenseIds.contains(id)) {
        selectedExpenseIds.remove(id);
      } else {
        selectedExpenseIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: BlocBuilder<GetAllExpensesCubit, GetAllExpensesState>(
        builder: (context, state) {
          if (state is GetAllExpensesLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            );
          } else if (state is GetAllExpensesFailure) {
            return Center(child: Text(state.errorMessage));
          } else if (state is GetAllExpensesSuccess) {
            final expenses = state.expenses;

            return Column(
              children: [
                Expanded(
                  child: TransactionListView(
                    expenses: expenses,
                    selectedIds: selectedExpenseIds,
                    onSelect: toggleSelect,
                  ),
                ),

                if (expenses.isNotEmpty)
                  CustomTextButton(
                    buttonText: 'Delete',
                  ), // ✅ هيظهر فقط لو فيه مصاريف
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
