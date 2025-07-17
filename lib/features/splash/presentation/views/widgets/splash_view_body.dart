import 'dart:math';
import 'package:flutter/material.dart';
import 'package:money_nest/features/auth/presentation/views/login_page.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool showImage = false;
  bool showText = false;

  @override
  void initState() {
    super.initState();
     debugPrint("initState triggered 🔥");
     WidgetsBinding.instance.addPostFrameCallback((_) {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        showImage = true;
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          showText = true;
        });
      });
    });
  });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// ✅ Image Animation from Top
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedSlide(
                  offset: showImage ? Offset.zero : const Offset(0, -0.5),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: showImage ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 800),
                    child: Image.asset(
                      'assets/images/money_graph.png',
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// ✅ Text Animation from Right
              Align(
                alignment: Alignment.center,
                child: AnimatedSlide(
                  offset: showText ? Offset.zero : const Offset(1, 0),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: showText ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 700),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text(
                            'Waste No More.',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No more wasting money.\nWe provide you easy access to saving money in a second.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.6,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              /// ✅ Gradient Button
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
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
                      margin: const EdgeInsets.only(right: 1.5, bottom: 1.5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(3),
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
