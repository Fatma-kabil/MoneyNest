import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/auth-footer.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
    //  backgroundColor: Colors.green,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //const SizedBox(height: 40),
                SizedBox(
                  height: screenHeight * 0.5, // يكون 25% من الشاشة بس
                  child: Image.asset(
                    'assets/images/auth.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),

                //   const SizedBox(height: 10),
                SignUpForm(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  incomeController: incomeController,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  onPressed: () {
                    // Call your Cubit signUp
                  },
                ),
                const SizedBox(height: 20),
                AuthFooter(
                  question: "Have an account? ",
                  actionText: "Sign In",
                  onTap: () {
                    //   Navigator.pushNamed(context, '/sign-in');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
