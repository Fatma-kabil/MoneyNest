import 'package:flutter/material.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_view_body.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // نسيب الـ backgroundColor شفاف عشان نستخدم gradient في flexibleSpace
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.tertiary,
              ],
            ),
          ),
        ),
        title: Text('Transactions', style: AppStyles.textMeduim20),
        centerTitle: true,
      ),
      body: const TransactionViewBody(),
    );
  }
}
