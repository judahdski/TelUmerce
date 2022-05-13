import 'package:flutter/material.dart';
import 'package:telumerce/pages/main_window.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffcdcdcd), width: .75),
          borderRadius: BorderRadius.circular(10.0)),
      child: const Text('Category 1', style: TextStyle(color: darkBlue)),
    );
  }
}
