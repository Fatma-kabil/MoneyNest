import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/app_style.dart';


class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow[700],
              ),
            ),
            Icon(CupertinoIcons.person_fill, color: Colors.yellow[800]),
          ],
        ),
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
              'John Doe',
              style: AppStyles.userNameText.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
