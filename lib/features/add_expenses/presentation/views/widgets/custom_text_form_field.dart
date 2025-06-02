import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.width,

    this.prefxIcon,
    this.ontap,
    this.hint,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    required this.borderRadius,
    this.isDense = false,
    this.filledColor,
  });
  final double width;
  //final double borderRedius;
  final IconData? prefxIcon;
  final Widget? suffixIcon;
  final void Function()? ontap;
  final String? hint;
  final TextEditingController? controller;
  final bool readOnly;
  final BorderRadius borderRadius;
  final bool isDense;
  final Color? filledColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        onTap: ontap,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: isDense,
          fillColor: filledColor ?? Colors.white,
          filled: true,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey,
          prefixIcon: prefxIcon != null ? Icon(prefxIcon) : null,
          prefixIconColor: Colors.grey,
          hintText: hint ?? "",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            //  borderRadius: BorderRadius.circular(borderRedius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
