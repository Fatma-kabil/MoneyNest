import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, this.buttonText});
  final void Function()? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kTextTabBarHeight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        child: Text(
          buttonText ?? 'Save',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
