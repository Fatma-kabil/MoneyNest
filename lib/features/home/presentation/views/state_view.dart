import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:money_nest/features/add_expenses/presentation/manager/get_all_expenses_cubit/get_all_expenses_cubit.dart';
import 'package:money_nest/features/home/presentation/views/widgets/chart.dart';


class StateView extends StatelessWidget {
  const StateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transaction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                child: BlocBuilder<GetAllExpensesCubit, GetAllExpensesState>(
                  builder: (context, state) {
                    if (state is GetAllExpensesSuccess) {
                      return MyChart(expenses: state.expenses);
                    } else if (state is GetAllExpensesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetAllExpensesFailure) {
                      return Center(child: Text('Error: ${state.errorMessage}'));
                    } else {
                      return const SizedBox(); // Default empty
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
