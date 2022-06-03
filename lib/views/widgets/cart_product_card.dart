import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/views/widgets/price_counter.dart';

import '../../const/color_scheme.dart';
import '../../const/text_theme.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      padding:
          const EdgeInsets.only(left: 6.0, top: 8.0, bottom: 8.0, right: 6.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffcdcdcd), width: .75),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          SizedBox(
              width: 94.0,
              child: Image.network(
                'https://s4.bukalapak.com/img/4954929533/large/TUMBLER_STARBUCKS_RARE_LIMITED_EDITION_2.jpg',
                fit: BoxFit.cover,
              )),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //  Category card
                    Container(
                      child: const Text('category', style: categoryText),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(4.0)),
                    ),

                    // Like button
                    SizedBox(
                        width: 28.0,
                        height: 28.0,
                        child: IconButton(
                            padding: const EdgeInsets.all(6.0),
                            iconSize: 16.0,
                            onPressed: () {
                              //  TODO : Delete this product from cart table
                            },
                            icon: const FaIcon(FontAwesomeIcons.xmark)))
                  ],
                ),

                // Product name
                const Text('Tumbler',
                    style: bodyLarge, overflow: TextOverflow.ellipsis),

                //Product price
                const PriceCountWidget(
                  amountOfProduct: 15, //product amount from order table
                  price: 443000, //product price from order table
                  isCartCard: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
