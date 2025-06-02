import 'package:flutter/material.dart';
import 'package:money_nest/features/add_expenses/date/data.dart';
import 'package:money_nest/features/add_expenses/presentation/views/widgets/grid_view_item.dart';

class CategoryIconsGrid extends StatelessWidget {
  final IconData? selectedIcon;
  final Function(IconData icon) onIconSelected;

  const CategoryIconsGrid({
    super.key,
    required this.selectedIcon,
    required this.onIconSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: categoryIcons.length,
          itemBuilder: (context, index) {
            final icon = categoryIcons[index];
            return GestureDetector(
              onTap: () => onIconSelected(icon),
              child: GridViewItem(
                icon: icon,
                isSelected: selectedIcon == icon,
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
        ),
      ),
    );
  }
}
