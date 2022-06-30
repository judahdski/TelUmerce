import 'package:flutter/material.dart';
import 'package:telumerce/model/wishlist.dart';
import 'package:telumerce/services/utils/helper_method.dart';
import 'package:telumerce/services/wishlist/all_wishlist_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/product_card.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

class WishlistFragment extends StatefulWidget {
  const WishlistFragment({Key? key}) : super(key: key);

  @override
  State<WishlistFragment> createState() => _WishlistFragmentState();
}

class _WishlistFragmentState extends State<WishlistFragment> {
  bool isLoading = false;
  bool isEmpty = false;

  final List _wishlistProducts = [];

  Future _getWishlistProducts() async {
    final response = await getAllWishlistService();

    if (response.isSuccessful) {
      var wishlistList = response.data as List<Wishlist>;
      _wishlistProducts.addAll(wishlistList);
      _checkEmptyList();
    } else {
      createErrorSnackbar(context, response);
    }
  }

  void _checkEmptyList() {
    if (_wishlistProducts.isEmpty) {
      setState(() => isEmpty = true);
    }
  }

  Future _loadWishlistFragment() async {
    setState(() => isLoading = true);

    await _getWishlistProducts();

    await Future.delayed(const Duration(milliseconds: 1));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadWishlistFragment();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Visibility(
            visible: isLoading,
            child: const Center(child: CircularProgressIndicator()),
            replacement: Visibility(
              visible: isEmpty,
              child: const Center(child: Text('Belum ada barang yang disukai.')),
              replacement: ResponsiveLayout(
                smallMobile: ListView.builder(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                  itemCount: _wishlistProducts.length,
                  itemBuilder: (_, int index) {
                    var wishlistProduct = _wishlistProducts[index] as Wishlist;
                    var product = wishlistProduct.product;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ProductCard(product: product),
                    );
                  },
                ),
                mediumMobile: ListView.builder(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  itemCount: _wishlistProducts.length,
                  itemBuilder: (_, int index) {
                    var wishlistProduct = _wishlistProducts[index] as Wishlist;
                    var product = wishlistProduct.product;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ProductCard(product: product),
                    );
                  },
                ),
              ),
            ),
          ),
        ),

        // Top-bar
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopBar(text: 'Wishlist'),
        ),
      ],
    );
  }
}
