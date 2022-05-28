import 'package:flutter/material.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../widgets/checkout_bar.dart';
import '../../widgets/product_card.dart';

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
        // List product
        Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          bottom: 0,
          child: ListView(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 118.0, left: 14.0, right: 14.0),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ProductCard(),
              )
            ],
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
          child: CheckoutBar(
              amountItem: amountItem, totalPrice: totalPrice.toDouble()),
        ),
      ],
    );
  }
}
