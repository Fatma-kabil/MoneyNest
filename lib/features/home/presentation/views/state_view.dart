import 'package:flutter/material.dart';

class StateView extends StatelessWidget {
  const StateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: Column(children: [Text('Transaction')]),
    ));
  }
}
