import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/model/product.dart';
import 'package:telumerce/services/product/all_category_service.dart';
import 'package:telumerce/services/product/all_product_services.dart';
import 'package:telumerce/services/utils/helper_method.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/category_card.dart';
import 'package:telumerce/views/widgets/product_card.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../../model/categori.dart';
import '../../widgets/home_search_bar.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final List _categories = [];
  final List _newestProducts = [];
  final List _products = [];
  String username = '';

  bool isLoading = false;

  Future _getAllCategories() async {
    final response = await getCategoriesService();

    if (response.isSuccessful) {
      _categories.addAll(response.data as List<Categori>);
    } else {
      createErrorSnackbar(context, response);
    }
  }

  Future _getAllProducts() async {
    final response = await getProductsService();

    if (response.isSuccessful) {
      _products.addAll(response.data as List<Product>);
      _getNewestProducts(response.data as List<Product>);
    } else {
      createErrorSnackbar(context, response);
    }
  }

  void _getNewestProducts(List<Product> data) {
    int size = (data.length > 10) ? 11 : data.length;

    for (int i = 0; i < size; i++) {
      _newestProducts.add(data[i]);
    }
  }

  Future _loadHomeFragment() async {
    setState(() => isLoading = true);

    await _getAllProducts();
    await _getAllCategories();
    username = widget.username.toUpperCase();

    await Future.delayed(const Duration(milliseconds: 2));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadHomeFragment();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: const Center(child: CircularProgressIndicator()),
      replacement: Stack(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14.0, top: 8.0, bottom: 18.0),
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
                      itemCount: _newestProducts.length,
                      itemBuilder: (_, int index) {
                        Product item = _newestProducts[index];

                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: ProductCard(product: item),
                        );
                      },
                    ),
                  ),

                  // Kategori
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 14.0, top: 24.0, bottom: 12.0),
                    child: Text('Kategori', style: labelMedium),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 14.0, right: 24.0),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _categories.map((categori) {
                        return CategoryCard(category: categori);
                      }).toList(),
                    ),
                  ),

                  //  Produk
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 14.0, top: 20.0, bottom: 12.0),
                    child: Text('Produk', style: labelMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      children: _products.map((product) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14.0),
                          child: ProductCard(
                              product: product),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              mediumMobile: ListView(
                children: [
                  // Teks greeting untuk user
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 8.0, bottom: 20.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(height: 1.5),
                        children: [
                          const TextSpan(text: 'Hai, ', style: bodyLarge),
                          TextSpan(text: '$username\n', style: titleLarge),
                          const TextSpan(
                              text: 'Ayo cari barang kesukaanmu.',
                              style: bodyMedium),
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
                      itemCount: _newestProducts.length,
                      itemBuilder: (_, int index) {
                        Product item = _newestProducts[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: ProductCard(product: item),
                        );
                      },
                    ),
                  ),

                  // Kategori
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, top: 26.0, bottom: 14.0),
                    child: Text('Kategori', style: labelLarge),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16.0, right: 24.0),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _categories.map((categori) {
                        return CategoryCard(category: categori);
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
                      children: _products.map((product) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: ProductCard(
                              product: product),
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
      ),
    );
  }
}
