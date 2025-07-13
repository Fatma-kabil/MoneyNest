import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditFieldDialog extends StatefulWidget {
  final String title;
  final String fieldName;
  final String initialValue;
  final bool isNumber;

  const EditFieldDialog({
    super.key,
    required this.title,
    required this.fieldName,
    required this.initialValue,
    this.isNumber = false,
  });

  @override
  State<EditFieldDialog> createState() => _EditFieldDialogState();
}

class _EditFieldDialogState extends State<EditFieldDialog> {
  late TextEditingController controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
  }

  Future<void> updateField() async {
    setState(() => isLoading = true);
    final uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      final value = widget.isNumber
          ? double.tryParse(controller.text) ?? 0.0
          : controller.text.trim();

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .update({widget.fieldName: value});

      Navigator.of(context).pop(true); // ✅ success
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Failed to update: $e')),
      );
      Navigator.of(context).pop(false); // ❌ failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit ${widget.title}"),
      content: TextField(
        controller: controller,
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Enter new ${widget.title.toLowerCase()}',
          border: const OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        isLoading
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator()),
              )
            : ElevatedButton(
                onPressed: updateField,
                child: const Text('Save'),
              ),
      ],
    );
  }
}
