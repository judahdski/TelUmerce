import 'package:flutter/material.dart';
import 'package:telumerce/views/widgets/cart_product_card.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../widgets/checkout_bar.dart';

class CartFragment extends StatelessWidget {
  const CartFragment({Key? key}) : super(key: key);

  //variable
  final int amountItem = 1; //userCart.length (ret. from db)
  final int totalPrice = 25000; //total price (ret. from db)

  //UI
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
          child: ListView.builder(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 124.0, left: 14.0, right: 14.0),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: CartProductCard(),
              );
            },
          ),
        ),

        // Top-bar
        Positioned(
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
          child: CheckoutBar(
              amountItem: amountItem, totalPrice: totalPrice.toDouble()),
        ),
      ],
    );
  }
}
