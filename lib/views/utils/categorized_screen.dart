import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';
import '../../data/categories_datasource.dart';
import '../../model/dummy/category.dart';

class CategorizedScreen extends StatelessWidget {
  CategorizedScreen({Key? key, required this.idCategory}) : super(key: key);

  final int idCategory;

  List<Categories> categoryList = CategoriesDatasource.getAllCategoriesDummy();

  String getCategoryName() {
    for (var category in categoryList) {
      if (category.id == idCategory) {
        return category.name;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            color: darkBlue,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 14.0)),
        title: Text(getCategoryName(), style: titleMedium),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        smallMobile: ListView.builder(
          padding: const EdgeInsets.only(top: 8.0, left: 14.0, right: 14.0),
          itemCount: 10,
          itemBuilder: (_, int index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 14.0),
              child: Text('dummy'),
            );
          },
        ),
        mediumMobile: ListView.builder(
          padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
          itemCount: 10,
          itemBuilder: (_, int index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text('dummy'),
            );
          },
        ),
      ),
    );
  }
}
