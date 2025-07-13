import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/features/home/presentation/manager/user/user_cubit.dart';
import 'package:money_nest/features/home/presentation/views/settings_view.dart';
import 'profile_avatar.dart';

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfileAvatar(),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: AppStyles.welcomeText.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            Text(
              name,
              style: AppStyles.userNameText.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsView()),
            ).then((_) {
              // ✅ بعد ما نرجع من صفحة الإعدادات
              final uid = FirebaseAuth.instance.currentUser!.uid;
              context.read<UserCubit>().fetchUserData(
                uid,
              ); // نجيب البيانات الجديدة
            });
          },
          icon: const Icon(CupertinoIcons.settings),
        ),
      ],
    );
  }
}
