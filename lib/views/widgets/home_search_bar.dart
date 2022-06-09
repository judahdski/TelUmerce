import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/color_scheme.dart';
import '../../const/text_theme.dart';
import '../utils/search_screen.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchScreen()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: const Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: const [
            FaIcon(FontAwesomeIcons.magnifyingGlass,
                size: 12.0, color: darkBlueShade300),
            SizedBox(width: 8.0),
            Text('Cari barang di sini..', style: searchBarText),
          ],
        ),
      ),
    );
  }
}
