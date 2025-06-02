import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff00B2E7);
const kSecondryColor = Color(0xffE064F7);
const kTertiaryColor = Color(0xffFF8D6c);
Color onLinear = Colors.grey;

final List<IconData> categoryIcons = [
  Icons.shopping_cart, // Groceries
  Icons.fastfood, // Food & Drinks
  Icons.home, // Rent / Housing
  Icons.lightbulb, // Utilities
  Icons.directions_bus, // Transportation
  Icons.wifi, // Phone & Internet
  Icons.checkroom, // Clothing
  Icons.local_hospital, // Healthcare
  Icons.spa, // Personal Care
  Icons.subscriptions, // Subscriptions
  Icons.school, // Education
  Icons.restaurant, // Dining Out
  Icons.movie, // Movies & Shows
  Icons.flight_takeoff, // Travel
  Icons.event, // Events
  Icons.work, // Office / Work
  Icons.luggage, // Business Travel
  Icons.computer, // Freelance Tools
  Icons.card_giftcard, // Gifts
  Icons.volunteer_activism, // Donations
  Icons.child_care, // Kids
  Icons.pets, // Pets
  Icons.warning, // Emergency
  Icons.savings, // Savings
  Icons.trending_up, // Investments
  Icons.casino, // Fun / Games
  Icons.fitness_center, // Gym / Fitness
  Icons.music_note, // Music / Entertainment
  Icons.book, // Books / Learning
  Icons.coffee, // Coffee / Cafes
  Icons.local_mall, // Shopping
  Icons.emoji_people, // Friends / Social
  Icons.bolt, // Energy
  Icons.car_rental, // Car Rental
  Icons.credit_card, // Credit / Finance
  Icons.local_atm, // ATM / Cash
];


List<Map<String,dynamic>> transactionData = [
  {
    'icon': Icons.food_bank,
    'color':Colors.yellow[700],
    'name': 'Food',
    'totalAmount': '\$45.00',
    'data': 'Today',
  },
  {
    'icon': Icons.shopping_bag_outlined,
    'color':Colors.purple,
    'name': 'Shopping',
    'totalAmount': '\$230.00',
    'data': 'Today',
  },
   {
    'icon': Icons.monitor_heart,
    'color':Colors.green,
    'name': 'Health',
    'totalAmount': '\$79.00',
    'data': 'Yesterday',
  },
   {
    'icon': Icons.airplanemode_active,
    'color':Colors.blue,
    'name': 'Travel',
    'totalAmount': '\$350.00',
    'data': 'Yesterday',
  },
];
