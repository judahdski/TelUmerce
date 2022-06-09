import 'package:flutter/material.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../../data/categories_datasource.dart';
import '../../../data/product_datasource.dart';
import '../../../model/dummy/category.dart';
import '../../../model/dummy/product.dart';
import '../../widgets/product_card.dart';

class WishlistFragment extends StatelessWidget {
  WishlistFragment({Key? key}) : super(key: key);

  List<Product> productList = ProductDatasource.getAllProductsDummy();
  List<Categories> categoryList = CategoriesDatasource.getAllCategoriesDummy();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          bottom: 0,
          child: ResponsiveLayout(
            smallMobile: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              itemCount: productList.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ProductCard(product: productList[index],),
                );
              },
            ),
            mediumMobile: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              itemCount: productList.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ProductCard(product: productList[index],),
                );
              },
            ),
          ),
        ),

        // Top-bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopBar(text: 'Wishlist'),
        ),
      ],
    );
  }
}
