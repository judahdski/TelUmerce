import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/model/product.dart';
import 'package:telumerce/services/product/all_product_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/product_card.dart';

import '../../const/color_scheme.dart';

class CategorizedScreen extends StatefulWidget {
  const CategorizedScreen(
      {Key? key, required this.categoryName, required this.categoryId})
      : super(key: key);

  final String categoryName;
  final int categoryId;

  @override
  State<CategorizedScreen> createState() => _CategorizedScreenState();
}

class _CategorizedScreenState extends State<CategorizedScreen> {
  final List _products = [];

  bool isLoading = false;
  bool isEmpty = false;

  Future _getProducts() async {
    setState(() => isLoading = true);
    final response = await getProductsService();
    List<Product> products = response.data as List<Product>;

    if (response.isSuccessful) {
      for (var product in products) {
        if (product.idCategory == widget.categoryId) {
          _products.add(product);
        }
      }

      _checkListIsEmpty();

      setState(() => isLoading = false);
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  void _checkListIsEmpty() {
    if (_products.isEmpty) {
      setState(() {
        isEmpty = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
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
        title: Text(widget.categoryName, style: titleMedium),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoading,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        replacement: Visibility(
          visible: isEmpty,
          child: const Center(
            child: Text(
              'Tidak ada barang dalam kategori ini.',
              textAlign: TextAlign.center,
            ),
          ),
          replacement: ResponsiveLayout(
            smallMobile: ListView.builder(
              padding: const EdgeInsets.only(top: 8.0, left: 14.0, right: 14.0),
              itemCount: _products.length,
              itemBuilder: (_, int index) {
                var product = _products[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: ProductCard(product: product),
                );
              },
            ),
            mediumMobile: ListView.builder(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
              itemCount: _products.length,
              itemBuilder: (_, int index) {
                var product = _products[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: ProductCard(product: product),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
