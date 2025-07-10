import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/core/utils/widgets/show_custom_snackbar.dart';
import 'package:money_nest/features/auth/domain/entites/sign_up_enitity.dart';
import 'package:money_nest/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/auth-footer.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:money_nest/features/home/presentation/manager/user/user_cubit.dart';
import 'package:money_nest/features/home/presentation/views/home_view.dart';

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
                // صورة الشخص
                ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 0.6,
                    widthFactor: 0.9,
                    child: Image.asset('assets/images/auth.png', height: 400),
                  ),
                ),

                // ✅ BlocConsumer علشان نتابع الحالة
                BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpSuccess) {
                      showCustomSnackBar(
                        context: context,
                        message: 'Account created successfully ✅',
                        isSuccess: true,
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (_) => UserCubit()
                                ..fetchUserData(
                                  FirebaseAuth.instance.currentUser!.uid,
                                ),
                              child: const HomeView(),
                            ),
                          ),
                        );
                      });
                    } else if (state is SignUpFailure) {
                      showCustomSnackBar(
                        context: context,
                        message: state.error,
                        isSuccess: false,
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is SignUpLoading;

                    return Column(
                      children: [
                        SignUpForm(
                          formKey: _formKey,
                          nameController: nameController,
                          emailController: emailController,
                          passwordController: passwordController,
                          incomeController: incomeController,
                        ),
                        const SizedBox(height: 30),

                        // ✅ الزر أو اللودينج
                        isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.grey,
                              )
                            : CustomButton(
                                buttonText: "Sign Up",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final user = SignUpEnitity(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      income: double.parse(
                                        incomeController.text,
                                      ),
                                    );

                                    context.read<SignUpCubit>().signUp(user);
                                  }
                                },
                              ),

                        const SizedBox(height: 20),

                        AuthFooter(
                          question: "Have an account? ",
                          actionText: "Login ",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => LoginPage()),
                            );
                            // Navigator.pushNamed(context, '/sign-in');
                          },
                        ),
                      ],
                    );
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
