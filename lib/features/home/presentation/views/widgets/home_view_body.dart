import 'package:flutter/material.dart';
import 'package:money_nest/features/home/presentation/views/widgets/total_balance_card.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_item.dart';
import 'package:money_nest/features/home/presentation/views/widgets/usr_info_header.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Column(
          children: [
            const UserInfoHeader(),
            const SizedBox(height: 20),
            const TotalBalanceCard(),
            const SizedBox(height: 40),
            TransactionHeader(
              onViewAllTap: () {
                // Handle view all action
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TransactionItem(
                      title: 'Food',
                      amount: '\$45.00',
                      date: 'Today',
                      icon: Icons.food_bank,
                      color: Colors.yellow[700]!,
                    ),
                  );
                },
              ),
            ),
            // Add more widgets here...
          ],
        ),
      ),
    );
  }
}
