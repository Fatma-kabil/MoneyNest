import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/core/utils/functions/delete_account.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';
import 'package:money_nest/features/home/presentation/views/widgets/change_password_dialog.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account Settings",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: const Text("Change Password"),
          trailing: IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (_) => const ChangePasswordDialog(),
              );
            },
          ),
        ),

        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.delete_forever),
          title: Text('Delete Account'),
          onTap: () {
            // Show confirmation dialog before deleting
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'Delete Your Account?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                content: Text(
                  'This will permanently remove your account and all your data.\nAre you sure you want to proceed?',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                   
                    onPressed: () {
                      Navigator.pop(context);
                      // Call your delete function here
                       deleteAccount(context);
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
