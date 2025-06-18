import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/features/home/presentation/views/widgets/income_expenses_colum.dart';

class TotalBalanceCard extends StatelessWidget {
  final double totalExpenses;

  const TotalBalanceCard({super.key, required this.totalExpenses});

  @override
  Widget build(BuildContext context) {
      final totalBalance = 2500.00 - totalExpenses;

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 2.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
          ],
          transform: GradientRotation(pi / 4),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey.shade300,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total Balance', style: AppStyles.totalBalanceTitle),
          const SizedBox(height: 12),
          Text('\$${totalBalance.toStringAsFixed(2)}', style: AppStyles.totalBalanceAmount), // ممكن تخليها dynamic بعدين
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IncomeExpenseColumn(
                  icon: CupertinoIcons.arrow_down,
                  iconColor: Colors.greenAccent,
                  title: 'Income',
                  amount: '\$ 2,500.00', // Placeholder
                ),
                IncomeExpenseColumn(
                  icon: CupertinoIcons.arrow_down,
                  iconColor: Colors.red,
                  title: 'Expenses',
                  amount: '\$ ${totalExpenses.toStringAsFixed(2)}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
