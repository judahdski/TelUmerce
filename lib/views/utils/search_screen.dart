import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/model/categori.dart';
import 'package:telumerce/services/product/all_category_service.dart';
import 'package:telumerce/services/product/all_product_services.dart';
import 'package:telumerce/services/utils/helper_method.dart';
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
  bool isSearching = false;
  bool isNotFound = false;
  final TextEditingController _searchController = TextEditingController();

  final List _products = [];
  final List _categories = [];
  final List<Product> _selectedProduct = [];

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
      _categories.addAll(categories);
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  void _setSearchMode() {
    if (isSearching) {
      FocusManager.instance.primaryFocus?.unfocus();
      if(_selectedProduct.isNotEmpty) {
        _selectedProduct.removeAt(0);
      }
      _searchController.text = '';
      setState(() => isSearching = false);
    } else {
      setState(() => isSearching = true);
    }
  }

  Future _onEditingComplete() async {
    final response = await getProductsService();

    if (response.isSuccessful) {
      _selectedProduct.clear();
      List<Product> products = response.data as List<Product>;

      for (var product in products) {
        if (product.productName.toLowerCase() ==
            _searchController.text.toString().toLowerCase()) {
          setState(() {
            _selectedProduct.add(product);
          });
        }
      }
      _checkIfNotFound();
    } else {
      createErrorSnackbar(context, response);
    }
  }

  void _checkIfNotFound() {
    if (_selectedProduct.isEmpty) {
      setState(() => isNotFound = true);
    }
  }

  Future _loadSearchScreen() async {
    setState(() => isLoading = true);

    await _getCategories();
    await _getProducts();

    await Future.delayed(const Duration(milliseconds: 1));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadSearchScreen();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
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
              if (isSearching) {
                _setSearchMode();
              } else {
                Navigator.pop(context);
              }
            },
            icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 14.0)),
        title: Container(
          height: 36.0,
          decoration: BoxDecoration(
              color: const Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(8.0)),
          child: TextField(
            onTap: () {
              _setSearchMode();
            },
            onEditingComplete: () {
              _onEditingComplete();
            },
            controller: _searchController,
            maxLines: 1,
            decoration: const InputDecoration(
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
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        replacement: Visibility(
          visible: isSearching,
          child: Visibility(
            visible: isNotFound,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(56.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                        'https://cdn.dribbble.com/users/2480087/screenshots/7009361/media/5be4690e38762fd53647912018e86189.gif'),
                  ),
                ),
                const Text(
                  'Maaf, barang yang anda cari tidak dapat ditemukan.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff707050),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
            replacement: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                children: _selectedProduct.map((product) {
                  return ProductCard(product: product);
                }).toList(),
              ),
            ),
          ),
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
      ),
    );
  }
}
