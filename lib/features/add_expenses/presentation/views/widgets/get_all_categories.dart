import 'package:flutter/material.dart';

class GetAllCategories extends StatelessWidget {
  const GetAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,

            ///   vertical: 8,
          ),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text('Food'),
                  dense: true,
                  tileColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
