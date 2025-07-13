import 'package:flutter/material.dart';
import 'package:money_nest/features/home/data/user_app_model.dart';
import 'package:money_nest/features/home/presentation/views/widgets/custom_listtile.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key, required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account Info",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        CustomListTile(
          leading: Icon(Icons.person_outline),
          title: "Name",
          subtitle: user.name,
          onPressed: () {},
        ),
        CustomListTile(
          title: "Email",
          subtitle: user.email,
          onPressed: () {},
          leading: Icon(Icons.email_outlined),
        ),
        CustomListTile(
          title: "Income",
          subtitle: '\$${user.income.toStringAsFixed(2)}',
          onPressed: () {},
          leading: Icon(Icons.monetization_on_outlined),
        ),
        const Divider(height: 40),
      ],
    );
  }
}
