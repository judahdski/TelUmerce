import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/services/product/all_product_services.dart';
import 'package:telumerce/services/product/detail_product_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';
import '../../data/categories_datasource.dart';
import '../../model/dummy/category.dart';
import '../../model/product.dart';
import '../widgets/category_card.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

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
        title: Container(
          height: 36.0,
          decoration: BoxDecoration(
              color: const Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(8.0)),
          child: const TextField(
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              prefixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 12.0,
                color: darkBlueShade300,
              ),
              hintText: 'Cari event di sini',
              hintStyle: searchBarText,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: ResponsiveLayout(
        smallMobile: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 14.0, bottom: 12.0),
              child: Text('Rekomendasi Produk untukmu', style: labelMedium),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: categoryList.map((category) {
                  return CategoryCard(category: category);
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 14.0, bottom: 12.0),
              child: Text('Produk unggul', style: labelMedium),
            ),
            SizedBox(
              height: 120.0,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 14.0, right: 4.0),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 14.0),
                    child: Text('dummy'),
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  getProducts();
                },
                child: const Text('Get all products')),
            ElevatedButton(
                onPressed: () {
                  getProductDetail();
                },
                child: const Text('Get product detail'))
          ],
        ),
        mediumMobile: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 18.0, left: 16.0, bottom: 14.0),
              child: Text('Rekomendasi Produk untukmu', style: labelLarge),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: categoryList.map((category) {
                  return CategoryCard(category: category);
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0, left: 16.0, bottom: 14.0),
              child: Text('Produk unggul', style: labelLarge),
            ),
            SizedBox(
              height: 120.0,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 14.0, right: 4.0),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 14.0),
                    child: Text('dummy'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getProducts() async {
    List<Product>? products;

    try {
      products = await getProductsService();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    products?.forEach((product) {
      if (kDebugMode) {
        print(product.id);
        print(product.productName);
        print(product.jumlahProduct);
      }
    });
  }

  void getProductDetail() async {
    Product? product;

    try {
      product = await getProductDetailService(4);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (product != null) {
      if (kDebugMode) {
        print(product.id);
        print(product.productName);
        print(product.jumlahProduct);
      }
    }
  }
}
