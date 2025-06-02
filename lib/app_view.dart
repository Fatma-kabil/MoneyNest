
import 'package:flutter/material.dart';
import 'package:money_nest/core/constants.dart';
import 'package:money_nest/features/home/presentation/views/home_view.dart';

class MoneyNest extends StatelessWidget {
  const MoneyNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(colorScheme:   ColorScheme.light(
      surface: Colors.grey.shade100, // Use this instead of 'background'
      onSurface: Colors.black,
      primary: kPrimaryColor,
      secondary: kSecondryColor,
      tertiary: kTertiaryColor,
      outline: onLinear
    ),),
      title: 'MoneyNeast',
      home: HomeView(),
    );
  }
}
