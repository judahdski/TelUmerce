import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';

import '../../../const/color_scheme.dart';
import '../../utils/search_screen.dart';
import '../../widgets/category_card.dart';
import '../../widgets/product_card.dart';

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
                  TextSpan(text: 'Judah Dasuki', style: titleMedium),
                ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14.0, bottom: 20.0),
              child: Text('Ayo cari barang kesukaanmu.',
                  style: screenSubTitleText),
            ),

            // Random product
            SizedBox(
              height: 120.0,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 14.0),
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (_, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: ProductCard(),
                  );
                },
              ),
            ),

            // Kategori
            const Padding(
              padding: EdgeInsets.only(left: 14.0, top: 24.0, bottom: 12.0),
              child: Text('Kategori', style: labelMedium),
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
              child: Text('Produk', style: labelMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: ProductCard(),
                  ),
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
              padding: const EdgeInsets.all(14.0),
              child: Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: darkBlueShade300,
                        borderRadius: BorderRadius.circular(6.0)),
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.search,
                            size: 14.0, color: Colors.white),
                        SizedBox(width: 10.0),
                        Text('Cari barangmu disini..',
                            style: TextStyle(color: Colors.white, fontSize: 12.0))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
