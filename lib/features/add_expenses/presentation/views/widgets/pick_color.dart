import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_button.dart';

class PickColor extends StatelessWidget {
  const PickColor({super.key, required this.onColorChanged, required this.categoryColor});
  final void Function(Color) onColorChanged;
  final  Color categoryColor;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorPicker(pickerColor: categoryColor, onColorChanged: onColorChanged),
          CustomTextButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
