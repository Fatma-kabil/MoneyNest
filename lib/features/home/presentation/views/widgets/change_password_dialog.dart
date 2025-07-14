import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/core/utils/widgets/show_custom_snackbar.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _formKey = GlobalKey<FormState>();
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  bool isLoading = false;

  Future<void> _changePassword() async {
    setState(() => isLoading = true);
    try {
      final user = FirebaseAuth.instance.currentUser!;
      final cred = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassController.text,
      );

      // إعادة التحقق من هوية المستخدم
      await user.reauthenticateWithCredential(cred);

      // تحديث كلمة المرور
      await user.updatePassword(newPassController.text);
      showCustomSnackBar(
        context: context,
        message: '✅ Password updated successfully, please login again',
        isSuccess: true,
      );
      Navigator.of(context).pop(true);
      await FirebaseAuth.instance.signOut();
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage())); // نجاح
    } catch (e) {
      showCustomSnackBar(
        context: context,
        message: '❌ Failed: ${e.toString()}',
        isSuccess: false,
      );
      Navigator.of(context).pop(false);
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.edit_note_rounded, color: Colors.blue, size: 28),
          const SizedBox(width: 10),
          Text(
            "Change Password",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          const SizedBox(height: 20),
        ],
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: currentPassController,
              decoration: const InputDecoration(
                labelText: "Current Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (val) =>
                  val == null || val.isEmpty ? "Enter current password" : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: newPassController,
              decoration: const InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (val) =>
                  val == null || val.length < 6 ? "Min 6 characters" : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              )
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _changePassword();
                  }
                },
                child: const Text('Update'),
              ),
      ],
    );
  }
}
