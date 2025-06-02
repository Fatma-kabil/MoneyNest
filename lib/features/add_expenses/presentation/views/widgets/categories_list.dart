import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/categoriey_icons_grid.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_button.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_form_field.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  IconData? iconSelected;
  Color categoryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 180, 209, 212),
          title: Text('Create a Category'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15),
                CustomTextFormField(
                  isDense: true,
                  borderRadius: BorderRadius.circular(10),
                  width: 0.9,
                  hint: "Name",
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  ontap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  isDense: true,
                  width: 0.9,
                  // borderRedius: 10,
                  hint: "Icon",
                  readOnly: true,
                  suffixIcon: Icon(CupertinoIcons.chevron_down, size: 18),
                  borderRadius: isExpanded
                      ? BorderRadius.vertical(top: Radius.circular(10))
                      : BorderRadius.circular(10),
                ),
                // استبدل جزء GridView السابق بهذا
                isExpanded
                    ? CategoryIconsGrid(
                        selectedIcon: iconSelected,
                        onIconSelected: (icon) {
                          setState(() {
                            iconSelected = icon;
                          });
                        },
                      )
                    : Container(),

                SizedBox(height: 20),
                CustomTextFormField(
                  filledColor: categoryColor,
                  isDense: true,
                  width: 0.9,
                  hint: "Color",
                  borderRadius: BorderRadius.circular(10),
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PickColor(
                          onColorChanged: (p0) {
                            setState(() {
                              categoryColor = p0;
                            });
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PickColor extends StatelessWidget {
  const PickColor({super.key, required this.onColorChanged});
  final void Function(Color) onColorChanged;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorPicker(pickerColor: Colors.blue, onColorChanged: onColorChanged),
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
