
import 'package:flutter/material.dart';
import 'package:money_nest/features/home/presentation/views/widgets/chart.dart';

class StateView extends StatelessWidget {
  const StateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Transaction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
              
              width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.width ,child:Padding(
                padding: const EdgeInsets.fromLTRB(12,20,12,12),
                child: MyChart(),
              ) ,)
          ],
        ),
      ),
    );
  }
}
