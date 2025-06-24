import 'dart:math';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
          ],
          transform: GradientRotation(pi / 4),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
