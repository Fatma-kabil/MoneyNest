// lib/features/home/views/widgets/transaction_header.dart
import 'package:flutter/material.dart';
import 'package:money_nest/app_style.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({super.key, required this.onViewAllTap});

  final VoidCallback onViewAllTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transaction',
          style: AppStyles.totalBalanceTitle.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onViewAllTap,
          child: Text(
            'View All',
            style: AppStyles.incomeExpense.copyWith(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
