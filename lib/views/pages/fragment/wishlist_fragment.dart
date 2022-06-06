import 'package:flutter/material.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../widgets/product_card.dart';

class WishlistFragment extends StatelessWidget {
  const WishlistFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          bottom: 0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
            itemCount: 12,
            itemBuilder: (_, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ProductCard(),
              );
            },
          ),
        ),

        // Top-bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopBar(text: 'Wishlist'),
        ),
      ],
    );
  }
}
