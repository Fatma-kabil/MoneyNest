import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/sign_up_page.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/auth-footer.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 35),
                // صورة الشخص
                ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 0.6,
                    widthFactor: 0.9,
                    child: Image.asset('assets/images/auth.png', height: 400),
                  ),
                ),

                LoginForm(
                  formKey: _formKey,

                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 30),

                CustomButton(
                  buttonText: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),

                const SizedBox(height: 20),

                AuthFooter(
                  question: "Don’t have an account? ",
                  actionText: "Sign Up",
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => SignUpPage()),
                    );
                    // Navigator.pushNamed(context, '/sign-in');
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
