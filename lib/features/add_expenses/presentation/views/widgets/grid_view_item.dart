

import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const GridViewItem({
    super.key,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: isSelected ? Colors.greenAccent : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 32),
    );
  }
}
