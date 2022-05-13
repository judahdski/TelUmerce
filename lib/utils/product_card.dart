import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/pages/main_window.dart';

import 'detail_product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  //style
  final TextStyle _categoryText =
      const TextStyle(color: Colors.white, fontSize: 8.0);
  final TextStyle _productNameText = const TextStyle(
      color: darkBlue,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis);
  final TextStyle _priceButton =
      const TextStyle(color: darkBlue, fontWeight: FontWeight.w800);
  final TextStyle _buyButtonText =
      const TextStyle(color: Colors.white, fontSize: 12.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  Navigate to detail product screen
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailProduct()));
      },
      child: Container(
        height: 116.0,
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.only(
            left: 6.0, top: 4.0, bottom: 8.0, right: 12.0),
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
                        child: Text('category', style: _categoryText),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(4.0)),
                      ),
                      // Like button
                      SizedBox(
                          width: 32.0,
                          height: 32.0,
                          child: IconButton(
                              padding: const EdgeInsets.all(6.0),
                              iconSize: 16.0,
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.heart)))
                    ],
                  ),
                  // Product name
                  Text('Tumbler', style: _productNameText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product price
                      Text('Rp. 25,000', style: _priceButton),
                      // Buy button
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text('Beli', style: _buyButtonText),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
