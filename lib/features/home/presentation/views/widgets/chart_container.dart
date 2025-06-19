import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/app_style.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/get_all_expenses_cubit/get_all_expenses_cubit.dart';
import 'package:money_nest/features/home/presentation/views/widgets/chart.dart';

class ChartContainer extends StatelessWidget {
  const ChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 1.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
        child: BlocBuilder<GetAllExpensesCubit, GetAllExpensesState>(
          builder: (context, state) {
            if (state is GetAllExpensesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllExpensesFailure) {
              return Center(
                child: Text(
                  'Error: ${state.errorMessage}',
                  style: AppStyles.textMeduim16.copyWith(color: Colors.red),
                ),
              );
            } else if (state is GetAllExpensesSuccess) {
              if (state.expenses.isEmpty) {
                return Center(
                  child: Text(
                    'No expenses yet 💸',
                    style: AppStyles.textMeduim16.copyWith(color: Colors.grey),
                  ),
                );
              } else {
                return MyChart(expenses: state.expenses);
              }
            } else {
              return const SizedBox(); // الحالة الافتراضية
            }
          },
        ),
      ),
    );
  }
}
