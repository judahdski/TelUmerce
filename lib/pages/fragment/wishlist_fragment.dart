import 'package:flutter/material.dart';

import '../../utils/product_card.dart';
import '../main_window.dart';

class WishlistFragment extends StatelessWidget {
  const WishlistFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: ListView(
            padding: const EdgeInsets.only(top: 8.0),
            children: const [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
            ],
          ),
        ),
        // Top-bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: const Text('Wishlist',
                textAlign: TextAlign.center, style: screenTitleText),
          ),
        ),
      ],
    );
  }
}
