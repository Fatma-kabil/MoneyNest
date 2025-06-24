import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController incomeController;

  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.incomeController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            controller: nameController,
            icon: Icons.person_outline,
            hint: "Name",
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: emailController,
            icon: Icons.email_outlined,
            hint: "Email",
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: passwordController,
            icon: Icons.lock_outline,
            hint: "Password",
            isObscure: true,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: incomeController,
            icon: Icons.attach_money,
            hint: "Income",
          ),
        ],
      ),
    );
  }
}
