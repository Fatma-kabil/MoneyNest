import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_nest/features/add_expenses/date/data.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/categoriey_icons_grid.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/custom_text_form_field.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/grid_view_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  IconData? iconSelected;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 180, 209, 212),
          title: Text('Create a Category'),
          content: Column(
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
                isDense: true,
                width: 0.9,
                hint: "Color",
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
        );
      },
    );
  }
}
