import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:telumerce/pages/fragment/cart_fragment.dart';
import 'package:telumerce/pages/fragment/profile_fragment.dart';
import 'package:telumerce/pages/fragment/wishlist_fragment.dart';

import 'fragment/home_fragment.dart';

const darkBlue = Color(0xff25253d);
const darkBlueShade300 = Color(0x5725253d);

const TextStyle screenTitleText =
    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: darkBlue);
const TextStyle screenSubTitleText =
    TextStyle(fontSize: 12.0, color: Color(0xff707070));
const TextStyle sectionTitleText =
    TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: darkBlue);

class MainWindow extends StatefulWidget {
  const MainWindow({Key? key}) : super(key: key);

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  //state
  int _pageIndex = 0;

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
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
            onTabChange: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            tabs: [
              GButton(
                  icon: Icons.home_filled,
                  text: 'Beranda',
                  textStyle: _navText),
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
        body: SafeArea(
            child: SafeArea(
          child: Center(
            child: _pageIndex == 0
                ? const HomeFragment()
                : _pageIndex == 1
                    ? const CartFragment()
                    : _pageIndex == 2
                        ? const WishlistFragment()
                        : const ProfileFragment(),
          ),
        )));
  }
}
