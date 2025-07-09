import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_nest/core/utils/widgets/show_custom_snackbar.dart';
import 'package:money_nest/features/auth/domain/entites/login_entity.dart';
import 'package:money_nest/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:money_nest/features/auth/presentation/views/sign_up_page.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/auth-footer.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:money_nest/features/auth/presentation/views/widgets/login_form.dart';
import 'package:money_nest/features/home/presentation/views/home_view.dart';

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
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      showCustomSnackBar(
                        context: context,
                        message: 'Login successfully ✅',
                        isSuccess: true,
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const HomeView()),
                        );
                      });
                    } else if (state is LoginFailure) {
                      showCustomSnackBar(
                        context: context,
                        message: state.errMessage,
                        isSuccess: false,
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is LoginLoading;

                    return Column(
                      children: [
                        LoginForm(
                          formKey: _formKey,

                          emailController: emailController,
                          passwordController: passwordController,
                        ),

                        const SizedBox(height: 30),
                        isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.grey,
                              )
                            : CustomButton(
                                buttonText: "Login",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final user = LoginEntity(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                    context.read<LoginCubit>().Login(user);
                                  }
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
