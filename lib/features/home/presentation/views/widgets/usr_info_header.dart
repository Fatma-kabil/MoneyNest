import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/features/home/presentation/views/settingsView.dart';
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SettingsView();
                },
              ),
            );
          },
          icon: const Icon(CupertinoIcons.settings),
        ),
      ],
    );
  }
}
