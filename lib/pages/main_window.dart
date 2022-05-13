import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'fragment/home_fragment.dart';

const darkBlue = Color(0xff25253d);
const darkBlueShade300 = Color(0x5725253d);

class MainWindow extends StatelessWidget {
  const MainWindow({Key? key}) : super(key: key);

  //style
  final TextStyle _navText = const TextStyle(fontSize: 10, color: darkBlue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
        child: GNav(
          backgroundColor: Colors.white,
          iconSize: 18.0,
          activeColor: darkBlue,
          color: darkBlueShade300,
          tabActiveBorder: Border.all(color: darkBlue),
          tabBorderRadius: 12,
          gap: 6.0,
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
          tabs: [
            GButton(
                icon: Icons.home_filled, text: 'Beranda', textStyle: _navText),
            GButton(
                icon: Icons.shopping_cart,
                text: 'Keranjang',
                textStyle: _navText),
            GButton(
                icon: Icons.monitor_heart_rounded,
                text: 'Wishlist',
                textStyle: _navText),
            GButton(icon: Icons.person, text: 'Akun', textStyle: _navText),
          ],
        ),
      ),
      body: const SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
