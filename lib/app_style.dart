import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle welcomeText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.grey, // هتتغير داخل الاستخدام لو عايزة
  );

  static const TextStyle userNameText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black, // هتتغير داخل الاستخدام لو عايزة
  );

  static const TextStyle totalBalanceTitle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle totalBalanceAmount = TextStyle(
    fontSize: 35,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle incomeExpense = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle incomeExpenseValue = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textMeduim16 = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textMeduim20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  // زودي أي استايلات تانية تحتاجيها هنا
}
