import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  
  final TextEditingController emailController;
  final TextEditingController passwordController;
  
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    
    required this.emailController,
    required this.passwordController,
    
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
         
          
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
          
        ],
      ),
    );
  }
}
