import 'package:flutter/material.dart';
import 'package:money_nest/app_style.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
    required this.color,
    this.isSelected = false,
  });

  final String title;
  final String amount;
  final String date;
  final IconData icon;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade300 : Colors.white, // ✅
        borderRadius: BorderRadius.circular(12),
     //   border: 
         //    Border.all(color: Colors.grey.shade600, width: 1)
          //  , // اختياري: تضيف حدود عند التحديد
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                Icon(icon, color: Colors.white),
              ],
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: AppStyles.textMeduim16.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${amount}',
                  style: AppStyles.textMeduim16.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  date,
                  style: AppStyles.incomeExpense.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
