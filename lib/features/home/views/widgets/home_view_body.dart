import 'package:flutter/material.dart';
import 'package:money_nest/features/home/views/widgets/usr_info_header.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Column(
          children: const [
            UserInfoHeader(),
            // Add more widgets here...
          ],
        ),
      ),
    );
  }
}
