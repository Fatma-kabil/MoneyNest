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

      Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Failed to update: $e')),
      );
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🎯 Title with icon
            Row(
              children: [
                const Icon(Icons.edit_note_rounded, color: Colors.blue, size: 28),
                const SizedBox(width: 10),
                Text(
                  "Edit ${widget.title}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 📝 Input field
            TextField(
              controller: controller,
              keyboardType:
                  widget.isNumber ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter new ${widget.title.toLowerCase()}',
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 8),
                isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : ElevatedButton.icon(
                        onPressed: updateField,
                        icon: const Icon(Icons.save_alt_rounded),
                        label: const Text("Save"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
