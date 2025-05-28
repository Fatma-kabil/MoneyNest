import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        const Icon(CupertinoIcons.person_fill, color: Color(0xFF8B8000)),
      ],
    );
  }
}
