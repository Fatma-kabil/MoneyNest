import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController incomeController;
  final GlobalKey<FormState> formKey;

  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.incomeController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: nameController,
            icon: Icons.person_outline,
            hint: "Name",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: emailController,
            icon: Icons.email_outlined,
            hint: "Email",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                  .hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: passwordController,
            icon: Icons.lock_outline,
            hint: "Password",
            isObscure: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password is required';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: incomeController,
            icon: Icons.attach_money,
            hint: "Income",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Income is required';
              } else if (double.tryParse(value) == null) {
                return 'Enter a valid number';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
