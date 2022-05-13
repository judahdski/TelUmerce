import 'package:flutter/material.dart';
import 'package:telumerce/pages/main_window.dart';

import '../../utils/category_card.dart';
import '../../utils/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //style
  final TextStyle _screenTitleText = const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, color: darkBlue);
  final TextStyle _screenSubTitleText =
      const TextStyle(fontSize: 12.0, color: Color(0xff707070));
  final TextStyle _sectionTitleText = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w600, color: darkBlue);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main-content
        ListView(
          children: [
            const SizedBox(height: 65.0),
            // User welcome text
            Padding(
              padding: const EdgeInsets.only(left: 14.0, bottom: 4.0),
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'Hai, ', style: TextStyle(color: darkBlue)),
                  TextSpan(text: 'Judah Dasuki', style: _screenTitleText),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, bottom: 18.0),
              child: Text('Ayo cari barang kesukaanmu.',
                  style: _screenSubTitleText),
            ),

            // Random product
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [Text('helllooooo')],
              ),
            ),

            // Kategori
            Padding(
              padding:
                  const EdgeInsets.only(left: 14.0, top: 24.0, bottom: 12.0),
              child: Text('Kategori', style: _sectionTitleText),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 14.0, right: 24.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [CategoryCard()],
              ),
            ),

            //  Produk
            Padding(
              padding:
                  const EdgeInsets.only(left: 14.0, top: 20.0, bottom: 12.0),
              child: Text('Produk', style: _sectionTitleText),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: const [
                  ProductCard(),
                ],
              ),
            ),
          ],
        ),

        // Top-bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            height: 65.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 0, 6.0, 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Search-bar button
                  Expanded(
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: const Color(0xfff5f5f5),
                          borderRadius: BorderRadius.circular(6.0)),
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.search,
                              size: 14.0, color: Color(0xff707070)),
                          const SizedBox(width: 10.0),
                          Text('Cari barangmu disini..',
                              style: _screenSubTitleText)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // GO-TO Cart button
                  SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: 18.0,
                          color: darkBlue,
                        )),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
