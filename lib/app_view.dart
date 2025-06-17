import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/core/constants.dart';
import 'package:money_nest/features/add_expenses/data/repos/expence_repo_impl.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/get_all_expenses_cubit/get_all_expenses_cubit.dart';
import 'package:money_nest/features/home/presentation/views/home_view.dart';

class MoneyNest extends StatelessWidget {
  const MoneyNest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  GetAllExpensesCubit(ExpenseRepoImpl())..get_all_expenses(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            surface: Colors.grey.shade100, // Use this instead of 'background'
            onSurface: Colors.black,
            primary: kPrimaryColor,
            secondary: kSecondryColor,
            tertiary: kTertiaryColor,
            outline: onLinear,
          ),
        ),
        title: 'MoneyNeast',
        home: HomeView(),
      ),
    );
  }
}
