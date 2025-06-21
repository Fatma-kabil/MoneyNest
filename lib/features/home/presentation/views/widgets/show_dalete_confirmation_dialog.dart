import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/core/utils/widgets/show_custom_snackbar.dart';
import 'package:money_nest/features/add_expenses/presentation/manager/delete_expenses/delete_expenses_cubit.dart';

import 'package:money_nest/features/add_expenses/presentation/manager/get_all_expenses_cubit/get_all_expenses_cubit.dart';

Future<void> showDeleteConfirmDialog({
  required BuildContext context,
  required List<String> selectedIds,
  required VoidCallback onSuccess,
}) async {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Delete Expenses'),
      content: const Text(
        'Are you sure you want to delete the selected expenses?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(ctx).pop(); // Close dialog

            await context.read<DeleteExpensesCubit>().deleteExpenses(
              selectedIds,
            );

            context.read<GetAllExpensesCubit>().get_all_expenses();

            // ✅ Success action
            onSuccess();

            // ✅ Show success SnackBar
            showCustomSnackBar(
              context: context,
              message: 'Expenses deleted successfully ✅',
              isSuccess: true,
            );
            //    ScaffoldMessenger.of(context).showSnackBar(
            //    const SnackBar(
            //    content: Text('Expenses deleted successfully ✅'),
            //  backgroundColor: Colors.green,
            //   duration: Duration(seconds: 2),
            //  ),
            //  );
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
