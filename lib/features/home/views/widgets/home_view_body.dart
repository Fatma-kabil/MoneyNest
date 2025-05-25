import 'package:flutter/material.dart';
import 'package:money_nest/features/home/views/widgets/total_balance_card.dart';
import 'package:money_nest/features/home/views/widgets/usr_info_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Column(
          children: [
            UserInfoHeader(),
            SizedBox(height: 20),
             TotalBalanceCard(),
            // Add more widgets here...
          ],
        ),
      ),
    );
  }
}
