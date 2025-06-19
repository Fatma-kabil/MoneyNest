import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_nest/features/add_expenses/domain/entites/expence_enitiy.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_item.dart';

class TransactionListView extends StatelessWidget {
  final List<ExpenceEnitiy> expenses;
  final String? selectedId;
  final void Function(String)? onSelect;

  const TransactionListView({
    super.key,
    required this.expenses,
    this.selectedId,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return const Center(
        child: Text(
          "You're all set! No expenses recorded yet — time to make your first move 💸",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: expenses.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final expense = expenses[index];
        final isSelected = selectedId == expense.id;

        return GestureDetector(
          onTap: () => onSelect?.call(expense.id),
          child: TransactionItem(
            title: expense.category.name,
            amount: expense.amount.toString(),
            date: DateFormat('dd MMM yyyy').format(expense.date),
            icon: expense.category.icon,
            color: expense.category.color,
            isSelected: isSelected, // 👈 هنا بنمرر if selected
          ),
        );
      },
    );
  }
}
