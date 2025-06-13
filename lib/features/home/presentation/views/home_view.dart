import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/features/add_expenses/data/repos/category_repo_impl.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/create_category_cubit/create_category_cubit.dart';
import 'package:money_nest/features/add_expenses/presentation/views/add_expenses_screen.dart';
import 'package:money_nest/features/home/presentation/views/state_view.dart';
import 'package:money_nest/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
            print(value);
          },
          //  fixedColor: Colors.red,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                size: 23,
                CupertinoIcons.home,
                color: index == 0 ? Colors.blue : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.graph_square_fill,
                size: 23,
                color: index == 1 ? Colors.blue : Colors.grey,
              ),
              label: 'stats',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BlocProvider(
                  create: (context) => CreateCategoryCubit(CategoryRepoImpl()),
                  child: AddExpensesScreen(),
                );
              },
            ),
          );
        },
        // elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // تحكّمي في الزوايا هنا
        ),
        child: Container(
          height: 58,
          width: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), // نفس الزوايا هنا
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.tertiary,
              ],
              transform: GradientRotation(pi / 4),
            ),
          ),
          child: Icon(CupertinoIcons.add),
        ),
      ),
      body: index == 0 ? HomeViewBody() : StateView(),
    );
  }
}
