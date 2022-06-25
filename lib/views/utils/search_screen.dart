import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/model/categori.dart';
import 'package:telumerce/services/product/all_category_service.dart';
import 'package:telumerce/services/product/all_product_services.dart';
import 'package:telumerce/services/product/detail_product_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/product_card.dart';

import '../../const/color_scheme.dart';
import '../../model/product.dart';
import '../widgets/category_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = false;

  final List _products = [];
  final List _categories = [];

  Future _getProducts() async {
    setState(() => isLoading = true);
    var response = await getProductsService();
    List products = response.data as List<Product>;

    if (response.isSuccessful) {
      setState(() => isLoading = false);

      for (int i = 0; i < products.length; i++) {
        var product = products[i];
        _products.add(product);

        if (i == 10) return;
      }
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  Future _getCategories() async {
    var response = await getCategoriesService();
    List<Categori> categories = response.data as List<Categori>;

    if (response.isSuccessful) {
      for (int i = 0; i < categories.length; i++) {
        var categori = categories[i];
        _categories.add(categori);

        if (i == 10) return;
      }
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  // TODO: ini ngambil product detail
  Future _getProductDetail() async {
    Product? product;

    try {
      var response = await getProductDetailService(4);
      product = response.data as Product;
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

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getProducts();
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
      body: Visibility(
        visible: isLoading,
        child: const Text('lagi loading'),
        replacement: ResponsiveLayout(
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
                  children: _categories.map((categori) {
                    return CategoryCard(category: categori);
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
                  itemCount: _products.length,
                  itemBuilder: (_, int index) {
                    var product = _products[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: ProductCard(product: product),
                    );
                  },
                ),
              ),
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
                  children: _categories.map((categori) {
                    return CategoryCard(category: categori);
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
                  itemCount: _products.length,
                  itemBuilder: (_, int index) {
                    var product = _products[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: ProductCard(product: product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
