import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';
import '../../data/categories_datasource.dart';
import '../../data/product_datasource.dart';
import '../../model/dummy/category.dart';
import '../../model/dummy/product.dart';
import '../widgets/product_card.dart';

class CategorizedScreen extends StatelessWidget {
  CategorizedScreen({Key? key}) : super(key: key);

  List<Product> productList = ProductDatasource.getAllProductsDummy();
  List<Categories> categoryList = CategoriesDatasource.getAllCategoriesDummy();

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
        title: const Text('Category 1', style: titleMedium),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        smallMobile: ListView.builder(
          padding: const EdgeInsets.only(top:8.0, left: 14.0, right: 14.0),
          itemCount: productList.length,
          itemBuilder: (_, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: ProductCard(product: productList[index]),
            );
          },
        ),
        mediumMobile: ListView.builder(
          padding: const EdgeInsets.only(top:10.0, left: 16.0, right: 16.0),
          itemCount: productList.length,
          itemBuilder: (_, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCard(product: productList[index],),
            );
          },
        ),
      ),
    );
  }
}
