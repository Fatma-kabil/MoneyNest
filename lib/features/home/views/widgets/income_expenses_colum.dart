import 'package:flutter/material.dart';
import 'package:money_nest/app_style.dart';

class IncomeExpenseColumn extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String amount;

  const IncomeExpenseColumn({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration:  BoxDecoration(
                        color: Colors.white30,
                        shape: BoxShape.circle,
                      ),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              size: 12,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.incomeExpense),
            Text(amount, style: AppStyles.incomeExpenseValue),
          ],
        ),
      ],
    );
  }
}
