import 'package:flutter/material.dart';

import '../../../const/color_scheme.dart';
import '../../widgets/category_card.dart';
import '../../widgets/product_card.dart';
import '../../utils/search_screen.dart';
import 'main_window.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

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
              padding:
                  const EdgeInsets.only(left: 14.0, top: 12.0, bottom: 4.0),
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(text: 'Hai, ', style: TextStyle(color: darkBlue)),
                  TextSpan(text: 'Judah Dasuki', style: screenTitleText),
                ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14.0, bottom: 20.0),
              child: Text('Ayo cari barang kesukaanmu.',
                  style: screenSubTitleText),
            ),

            // Random product
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 14.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
              ),
            ),

            // Kategori
            const Padding(
              padding: EdgeInsets.only(left: 14.0, top: 24.0, bottom: 12.0),
              child: Text('Kategori', style: sectionTitleText),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 14.0, right: 24.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [CategoryCard()],
              ),
            ),

            //  Produk
            const Padding(
              padding: EdgeInsets.only(left: 14.0, top: 20.0, bottom: 12.0),
              child: Text('Produk', style: sectionTitleText),
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
                    child: InkWell(
                      onTap: () {
                        //  Navigate to search screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()));
                      },
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(6.0)),
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.search,
                                size: 14.0, color: Color(0xff707070)),
                            SizedBox(width: 10.0),
                            Text('Cari barangmu disini..',
                                style: screenSubTitleText)
                          ],
                        ),
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
