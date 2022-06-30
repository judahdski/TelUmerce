import 'package:flutter/material.dart';
import 'package:telumerce/model/cart.dart';
import 'package:telumerce/services/cart/all_cart_services.dart';
import 'package:telumerce/services/utils/helper_method.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/cart_product_card.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../../model/cart_item.dart';
import '../../widgets/checkout_bar.dart';

class CartFragment extends StatefulWidget {
  const CartFragment({Key? key}) : super(key: key);

  @override
  State<CartFragment> createState() => _CartFragmentState();
}

class _CartFragmentState extends State<CartFragment> {
  bool isLoading = false;
  bool isListEmpty = false;

  int amountItem = 0;
  int totalPrice = 0;
  final List<CartItem> _cartItems = [];

  //function
  int _setTotalPrice() {
    int sum = 0;

    for (var cartItem in _cartItems) {
      int jumlahBarang = cartItem.jumlahBarang;
      int hargaProduct = cartItem.produk.harga;
      int totalHargaBarang = jumlahBarang * hargaProduct;
      sum += totalHargaBarang;
    }

    return sum;
  }

  Future _getCartItems() async {
    final response = await getCartService();
    var cart = response.data as Cart;
    List<CartItem> cartItems = cart.cartItem;

    if (response.isSuccessful) {
      _cartItems.addAll(cartItems);

      _checkIfListIsEmpty();
    } else {
      createErrorSnackbar(context, response);
    }
  }

  void _checkIfListIsEmpty() {
    if (_cartItems.isEmpty) {
      setState(() => isListEmpty = true);
    }
  }

  void _setCheckoutbarContent() {
    amountItem = _cartItems.length;
  }

  Future _loadCartFragment() async {
    setState(() => isLoading = true);

    await _getCartItems();
    _setCheckoutbarContent();
    totalPrice = _setTotalPrice();

    await Future.delayed(const Duration(milliseconds: 1));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadCartFragment();
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
        // Main-content
        Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Visibility(
            visible: isLoading,
            child: const Center(child: CircularProgressIndicator()),
            replacement: Visibility(
              visible: isListEmpty,
              child: const Center(
                child: Text('Belum ada barang yang dipesan.'),
              ),
              replacement: ResponsiveLayout(
                smallMobile: ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 124.0, left: 14.0, right: 14.0),
                  itemCount: _cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    var cartItem = _cartItems[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: CartProductCard(cartItemId: cartItem.id),
                    );
                  },
                ),
                mediumMobile: ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 132.0, left: 16.0, right: 16.0),
                  itemCount: _cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    var cartItem = _cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: CartProductCard(cartItemId: cartItem.id),
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
          child: TopBar(text: 'Keranjang'),
        ),

        // Checkout-bar
        Positioned(
          bottom: 16.0,
          left: 14.0,
          right: 14.0,
          child: Visibility(
            visible: isLoading,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffe5e5e5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            replacement: CheckoutBar(
              amountItem: amountItem,
              totalPrice: totalPrice,
              isListEmpty: isListEmpty,
            ),
          ),
        ),
      ],
    );
  }
}
