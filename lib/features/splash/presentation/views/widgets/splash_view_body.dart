import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              /// ✅ صورة 3D شفافة بتغطي النص الأول
              Container(
                // color: Colors.red.withOpacity(0.1), // مؤقت عشان تشوفي حدود الصورة
                child: Image.asset(
                  'assets/images/money_graph.png',
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),

              const SizedBox(height: 30),

              /// ✅ العنوان الكبير
              const Text(
                'Waste No More.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 16),

              /// ✅ وصف ناعم
              const Text(
                'No more wasting money.We provide you \neasy access to saving money in a second.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, height: 1.6, color: Colors.grey),
              ),

              const Spacer(),

              /// ✅ زر دائري أنيق
              // الزر
              /// ✅ زر دائري أنيق
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.tertiary,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 1.5,
                        bottom: 1.5,
                      ), // خلي الجوانب دي بس فيها Gradient
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(3), // البوردر الأبيض
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            transform: GradientRotation(pi / 4),
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.secondary,
                              Theme.of(context).colorScheme.tertiary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
