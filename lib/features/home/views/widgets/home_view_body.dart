import 'package:flutter/material.dart';
import 'package:money_nest/features/home/views/widgets/total_balance_card.dart';
import 'package:money_nest/features/home/views/widgets/usr_info_header.dart';
import 'package:money_nest/features/home/views/widgets/transaction_header.dart';

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
            const SizedBox(height: 20),
            TransactionHeader(
              onViewAllTap: () {
                // Handle view all action
              },
            ),
            const SizedBox(height: 20),
            // Add more widgets here...
          ],
        ),
      ),
    );
  }
}
