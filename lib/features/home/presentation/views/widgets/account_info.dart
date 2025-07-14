import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/features/home/data/user_app_model.dart';
import 'package:money_nest/features/home/presentation/manager/user/user_cubit.dart';
import 'package:money_nest/features/home/presentation/views/widgets/custom_listtile.dart';
import 'package:money_nest/features/home/presentation/views/widgets/edit_field_page.dart';

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

        /// 👤 Name
        CustomListTile(
          leading: const Icon(Icons.person_outline),
          title: "Name",
          subtitle: user.name,
          onPressed: () async {
            final updated = await showDialog(
              context: context,
              builder: (_) => EditFieldDialog(
                title: "Name",
                fieldName: "name",
                initialValue: user.name,
              ),
            );

            if (updated == true) {
              context.read<UserCubit>().fetchUserData(user.id);
            }
          },
        ),

        /// 📧 Email (not editable)
        CustomListTile(
          leading: const Icon(Icons.email_outlined),
          title: "Email",
          subtitle: user.email,
          onPressed:  () async {
            final updated = await showDialog(
              context: context,
              builder: (_) => EditFieldDialog(
                title: "Email",
                fieldName: "email",
                initialValue: user.email,
              ),
            );

            if (updated == true) {
              context.read<UserCubit>().fetchUserData(user.id);
            }
          },// disabled
        ),

        /// 💰 Income
        CustomListTile(
          leading: const Icon(Icons.monetization_on_outlined),
          title: "Income",
          subtitle: '\$${user.income.toStringAsFixed(2)}',
          onPressed: () async {
            final updated = await showDialog(
              context: context,
              builder: (_) => EditFieldDialog(
                title: "Income",
                fieldName: "income",
                initialValue: user.income.toString(),
                isNumber: true,
              ),
            );

            if (updated == true) {
              context.read<UserCubit>().fetchUserData(user.id);
            }
          },
        ),

        const Divider(height: 40),
      ],
    );
  }
}
