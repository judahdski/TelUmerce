import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/model/dummy/category.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../utils/categorized_screen.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  final Categories category;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategorizedScreen(idCategory: widget.category.id)));
      },
      child: ResponsiveLayout(
          smallMobile: Container(
            margin: const EdgeInsets.only(right: 12.0),
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffcdcdcd)),
                borderRadius: BorderRadius.circular(6.0)),
            child: Text(widget.category.name, style: bodySmall),
          ),
          mediumMobile: Container(
            margin: const EdgeInsets.only(right: 14.0),
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffcdcdcd)),
                borderRadius: BorderRadius.circular(8.0)),
            child: Text(widget.category.name, style: bodyMedium),
          )),
    );
  }
}
