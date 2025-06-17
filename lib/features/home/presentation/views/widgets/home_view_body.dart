import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/get_all_expenses_cubit/get_all_expenses_cubit.dart';
import 'package:money_nest/features/home/presentation/views/widgets/total_balance_card.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_item.dart';
import 'package:money_nest/features/home/presentation/views/widgets/usr_info_header.dart';
import 'package:money_nest/features/home/presentation/views/widgets/transaction_header.dart';
import 'package:intl/intl.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
   //  context.read<GetAllExpensesCubit>().get_all_expenses();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Column(
          children: [
            const UserInfoHeader(),
            const SizedBox(height: 20),
            const TotalBalanceCard(),
            const SizedBox(height: 30),
            TransactionHeader(
              onViewAllTap: () {
                // Handle view all action
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<GetAllExpensesCubit, GetAllExpensesState>(
                builder: (context, state) {
                  if (state is GetAllExpensesLoading) {
                    return const Center(child: CircularProgressIndicator(color: Colors.grey,));
                  } else if (state is GetAllExpensesFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is GetAllExpensesSuccess) {
                    final expenses = state.expenses;
                    if (expenses.isEmpty) {
                      return const Center(child: Text("No expenses yet"));
                    }
                    return ListView.separated(
                      itemCount: expenses.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final expense = expenses[index];
                        return TransactionItem(
                          title: expense.category.name,
                          amount: expense.amount.toString(),
                          date: DateFormat('dd MMM yyyy').format(expense.date),
                          icon: expense.category.icon,
                          color: expense.category.color, // ?? Colors.grey,
                        );
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
