import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import '../../const/color_scheme.dart';
import '../pages/fragment/main_window.dart';
import '../widgets/category_card.dart';
import '../widgets/product_card.dart';

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
          color: const Color(0xffF6F2F2),
          child: const TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 12.0,
                ),
                prefixIconColor: Color(0xff96969b),
                hintText: 'Cari event di sini...',
                hintStyle: TextStyle(color: Color(0xff96969b)),
                border: InputBorder.none),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: const [
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
