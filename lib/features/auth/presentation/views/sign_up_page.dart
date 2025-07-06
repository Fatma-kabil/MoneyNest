import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/auth-footer.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 0.6, // قص من تحت
                    widthFactor: 0.9, // قص من الجوانب
                    child: Image.asset('assets/images/auth.png', height: 400),
                  ),
                ),

                SignUpForm(
                  formKey: _formKey,
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  incomeController: incomeController,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ✅ البيانات صح .. استدعاء كيوبيت أو ريبوزيتوري
                      debugPrint("Name: ${nameController.text}");
                      debugPrint("Email: ${emailController.text}");
                      debugPrint("Password: ${passwordController.text}");
                      debugPrint("Income: ${incomeController.text}");
                    }
                  },
                ),
                const SizedBox(height: 20),
                AuthFooter(
                  question: "Have an account? ",
                  actionText: "Sign In",
                  onTap: () {
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
