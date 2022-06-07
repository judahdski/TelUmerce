import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:telumerce/const/text_theme.dart';

import '../../../const/color_scheme.dart';
import 'cart_fragment.dart';
import 'home_fragment.dart';
import 'profile_fragment.dart';
import 'wishlist_fragment.dart';

class MainWindow extends StatefulWidget {
  final int pageIndex;

  const MainWindow(this.pageIndex, {Key? key}) : super(key: key);

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  int _pageIndex = 0;

  @override
  void initState() {
    _pageIndex = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: GNav(
          backgroundColor: Colors.white,
          iconSize: 16.0,
          activeColor: darkBlue,
          color: darkBlueShade300,
          tabActiveBorder: Border.all(color: darkBlue),
          tabBorderRadius: 12,
          gap: 8.0,
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
          selectedIndex: _pageIndex,
          onTabChange: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          tabs: const [
            GButton(
                icon: FontAwesomeIcons.house,
                text: 'Beranda',
                textStyle: labelSmall),
            GButton(
                icon: FontAwesomeIcons.cartShopping,
                text: 'Keranjang',
                textStyle: labelSmall),
            GButton(
                icon: FontAwesomeIcons.solidHeart,
                text: 'Wishlist',
                textStyle: labelSmall),
            GButton(
                icon: FontAwesomeIcons.solidUser,
                text: 'Akun',
                textStyle: labelSmall),
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
        ),
      ),
    );
  }
}
