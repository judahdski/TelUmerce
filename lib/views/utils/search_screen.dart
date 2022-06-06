import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/widgets/product_card.dart';

import '../../const/color_scheme.dart';
import '../widgets/category_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            color: darkBlue,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 14.0)),
        title: Container(
          height: 36.0,
          decoration: BoxDecoration(
            color: const Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: const TextField(
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                prefixIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 12.0,
                  color: darkBlueShade300,
                ),
                hintText: 'Cari event di sini',
                hintStyle: searchBarText,
                border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0, left: 14.0, bottom: 12.0),
            child: Text('Rekomendasi Produk untukmu', style: labelMedium),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: const [
                CategoryCard(),
                CategoryCard(),
                CategoryCard(),
                CategoryCard(),
                CategoryCard(),
                CategoryCard(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0, left: 14.0, bottom: 12.0),
            child: Text('Produk unggul', style: labelMedium),
          ),
          SizedBox(
            height: 120.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (_, int index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 14.0),
                  child: ProductCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
