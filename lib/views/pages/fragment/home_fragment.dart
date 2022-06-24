import 'dart:math';

import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/data/categories_datasource.dart';
import 'package:telumerce/model/dummy/category.dart';
import 'package:telumerce/model/product.dart';
import 'package:telumerce/services/product/all_product_services.dart';
import 'package:telumerce/services/user/get_user_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/product_card.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../../model/user.dart';
import '../../widgets/category_card.dart';
import '../../widgets/home_search_bar.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List _recommendedProducts = [];
  List _allProducts = [];
  String username = 'null';
  List<Categories> categoryList = CategoriesDatasource.getAllCategoriesDummy();

  @override
  void initState() {
    super.initState();
    _getUserInfo();
    _getAllProducts();
  }

  Future _getUserInfo() async {
    final response = await getUserService();
    var user = response.data as User;

    setState(() {
      username = user.name.toUpperCase();
    });
  }

  Future _getAllProducts() async {
    final response = await getProductsService();

    if (response.isSuccessful) {
      setState(() {
        _allProducts.addAll(response.data as List<Product>);
        _recommendedProducts = randomiseProducts(response.data as List<Product>);
      });
    } else {
      // TODO: failed get data
    }
  }

  List<Product> randomiseProducts(List<Product> data) {
    var size = data.length-1;
    int randomNum = 0;
    try {
      randomNum = Random().nextInt(size);
    } catch(e) {
      print(e.toString());
    }
    List<Product> newData = [];

    for(int i = 0; i < 10; i++) {
      newData.add(data[i]);
    }

    return newData;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main-content
        Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          bottom: 0,
          child: ResponsiveLayout(
            smallMobile: ListView(
              children: [
                // Teks greeting untuk user
                Padding(
                  padding:
                      const EdgeInsets.only(left: 14.0, top: 8.0, bottom: 18.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(height: 1.3),
                      children: [
                        const TextSpan(text: 'Hai, ', style: bodyMedium),
                        TextSpan(text: '$username\n', style: titleMedium),
                        const TextSpan(
                            text: 'Ayo cari barang kesukaanmu.',
                            style: bodySmall),
                      ],
                    ),
                  ),
                ),

                // Product random
                SizedBox(
                  height: 120.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 14.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: _recommendedProducts.length,
                    itemBuilder: (_, int index) {
                      Product item = _recommendedProducts[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductCard(product: item),
                      );
                    },
                  ),
                ),

                // Kategori
                const Padding(
                  padding: EdgeInsets.only(left: 14.0, top: 24.0, bottom: 12.0),
                  child: Text('Kategori', style: labelMedium),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 14.0, right: 24.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoryList.map((category) {
                      return CategoryCard(category: category);
                    }).toList(),
                  ),
                ),

                //  Produk
                const Padding(
                  padding: EdgeInsets.only(left: 14.0, top: 20.0, bottom: 12.0),
                  child: Text('Produk', style: labelMedium),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    children: _allProducts.map((product) {
                      return ProductCard(product: product);
                    }).toList(),
                  ),
                ),
              ],
            ),
            mediumMobile: ListView(
              children: [
                // Teks greeting untuk user
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 20.0),
                  child: RichText(
                    text: TextSpan(
                        style: const TextStyle(height: 1.5),
                        children: [
                          const TextSpan(text: 'Hai, ', style: bodyLarge),
                          TextSpan(text: '$username\n', style: titleLarge),
                          const TextSpan(
                              text: 'Ayo cari barang kesukaanmu.',
                              style: bodyMedium),
                        ]),
                  ),
                ),

                // Product random
                SizedBox(
                  height: 120.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 14.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: _recommendedProducts.length,
                    itemBuilder: (_, int index) {
                      Product item = _recommendedProducts[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductCard(product: item),
                      );
                    },
                  ),
                ),

                // Kategori
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 26.0, bottom: 14.0),
                  child: Text('Kategori', style: labelLarge),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16.0, right: 24.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoryList.map((category) {
                      return CategoryCard(category: category);
                    }).toList(),
                  ),
                ),

                //  Produk
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 22.0),
                  child: Text('Produk', style: labelLarge),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: _allProducts.map((product) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ProductCard(product: product),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Top-bar
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopBar(
            topBarWidget: HomeSearchBar(),
          ),
        )
      ],
    );
  }
}
