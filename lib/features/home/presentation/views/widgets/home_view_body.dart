import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:money_nest/features/add_expenses/presentation/manager/get_all_expenses_cubit/get_all_expenses_cubit.dart';
import 'package:money_nest/features/home/presentation/manager/user/user_cubit.dart';
import 'package:money_nest/features/home/presentation/views/transaction_view.dart';
import 'package:money_nest/features/home/presentation/views/widgets/total_balance_card.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_header.dart';
import 'package:money_nest/features/home/presentation/views/widgets/usr_info_header.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: BlocBuilder<GetAllExpensesCubit, GetAllExpensesState>(
          builder: (context, state) {
            if (state is GetAllExpensesLoading) {
              return  Center(
                child: LoadingAnimationWidget.progressiveDots(
                      color: Colors.grey,
                      size: 50,
                    ),
              );
            } else if (state is GetAllExpensesFailure) {
              return Center(child: Text(state.errorMessage));
            } else if (state is GetAllExpensesSuccess) {
              final expenses = state.expenses;
              final totalExpenses = expenses.fold<double>(
                0,
                (previousValue, element) => previousValue + element.amount,
              );

              return BlocBuilder<UserCubit, UserState>(
                builder: (context, userState) {
                  if (userState is UserLoading) {
                    return  Center(child: LoadingAnimationWidget.progressiveDots(
                      color: Colors.grey,
                      size: 50,
                    ));
                  } else if (userState is UserLoaded) {
                    return Column(
                      children: [
                         UserInfoHeader(name: userState.user.name,),
                        const SizedBox(height: 20),
                        TotalBalanceCard(
                          totalExpenses: totalExpenses,
                          income: userState.user.income,
                        ),
                        const SizedBox(height: 30),
                        TransactionHeader(
                          onViewAllTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TransactionView(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: TransactionListView(expenses: expenses),
                        ),
                      ],
                    );
                  } else if (userState is UserError) {
                    return Center(child: Text(userState.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
