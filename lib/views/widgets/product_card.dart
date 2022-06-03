import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';

import '../../const/color_scheme.dart';
import '../utils/detail_product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  //variable
  bool isFav = false;

  //function
  void setWishlist() {
    //  TODO : Change isFav state
    //  TODO : Change the love icon color
    //  TODO : Add to the wishlist (create new wishlist's table data)

    setState(() => isFav = !isFav);
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailProduct()));
      },
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          //regular card
          if (constraints.maxWidth < 900) {
            return Container(
              height: 120.0,
              padding: const EdgeInsets.only(
                  left: 6.0, top: 8.0, bottom: 8.0, right: 6.0),
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
                                      //  TODO : Change isFav state
                                      //  TODO : Change the love icon color
                                      //  TODO : Add to the wishlist
                                      setWishlist();
                                    },
                                    color: (isFav) ? Colors.red : Colors.grey,
                                    icon: (isFav) ? const FaIcon(FontAwesomeIcons.solidHeart) : const FaIcon(FontAwesomeIcons.heart)))
                          ],
                        ),

                        // Product name
                        const Text('Tumbler', style: bodyLarge, overflow: TextOverflow.ellipsis),

                        //Product price
                        const Text('Rp. 25,000', style: labelLarge)
                      ],
                    ),
                  )
                ],
              ),
            );
          //  side scrollview card
          } else {
            return Container(
              height: 120.0,
              width: 300.0,
              padding: const EdgeInsets.only(
                  left: 6.0, top: 8.0, bottom: 8.0, right: 6.0),
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
                                      setWishlist();
                                    },
                                    color: (isFav) ? Colors.red : Colors.grey,
                                    icon: (isFav) ? const FaIcon(FontAwesomeIcons.solidHeart) : const FaIcon(FontAwesomeIcons.heart)))
                          ],
                        ),

                        // Product name
                        const Text('Tumbler', style: bodyLarge),

                        // Product price
                        const Text('Rp. 25,000', style: labelLarge),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}