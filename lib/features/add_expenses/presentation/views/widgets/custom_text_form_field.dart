import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.width,
    required this.borderRedius,
    required this.icon,
    this.ontap,
    this.hint, this.controller,
  });
  final double width;
  final double borderRedius;
  final IconData icon;
  final void Function()? ontap;
  final String? hint;
 final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      child: TextFormField(
        controller: controller,
        onTap: ontap,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(icon),
          prefixIconColor: Colors.grey,
          hintText: hint ?? "",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRedius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
