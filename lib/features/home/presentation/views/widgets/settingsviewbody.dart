import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});
  

  @override
  Widget build(BuildContext context) {
     final user = FirebaseAuth.instance.currentUser;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 🧑 Account Info
        const Text(
          "Account Info",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text("Name"),
          subtitle: Text(user?.displayName ?? 'No name'),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: go to edit name screen
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.email_outlined),
          title: const Text("Email"),
          subtitle: Text(user?.email ?? 'No email'),
        ),
        const Divider(height: 40),

        // ⚙️ Account Settings
        const Text(
          "Account Settings",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: const Text("Change Password"),
          onTap: () {
            // TODO: Navigate to change password page
          },
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
      ],
    );
  }
}
