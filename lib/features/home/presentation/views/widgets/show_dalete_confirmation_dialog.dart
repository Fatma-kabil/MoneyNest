 import 'package:flutter/material.dart';

void showDeleteConfirmationDialog(//List<ExpenceEnitiy> expenses, 
dynamic context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Expenses'),
        content: const Text('Are you sure you want to delete the selected expenses?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.pop(context);
              
            },
          ),
        ],
      ),
    );
  }