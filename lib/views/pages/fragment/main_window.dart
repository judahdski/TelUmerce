import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:telumerce/const/key.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/services/auth/create_storage.dart';

import '../../../const/color_scheme.dart';
import 'cart_fragment.dart';
import 'home_fragment.dart';
import 'profile_fragment.dart';
import 'wishlist_fragment.dart';

class MainWindow extends StatefulWidget {
  const MainWindow(this.pageIndex, {Key? key}) : super(key: key);

  final int pageIndex;

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  bool isLoading = false;
  int _pageIndex = 0;
  String username = '';

  Future _getUserInfo() async {
    var value = await storage.read(key: usernameKey);
    return value;
  }

  Future _setUserName() async {
    var name = await _getUserInfo();
    setState(() => username = name);
  }

  Future _loadMainWindow() async {
    setState(() => isLoading = true);

    await _setUserName();
    _pageIndex = widget.pageIndex;

    await Future.delayed(const Duration(microseconds: 524));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadMainWindow();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
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
      body: Visibility(
        visible: isLoading,
        child: const Center(
          child: Center(
            child: CircularProgressIndicator(color: Colors.redAccent),
          ),
        ),
        replacement: SafeArea(
          child: SafeArea(
            child: Center(
              child: _pageIndex == 0
                  ? HomeFragment(username: username)
                  : _pageIndex == 1
                      ? const CartFragment()
                      : _pageIndex == 2
                          ? const WishlistFragment()
                          : ProfileFragment(username: username),
            ),
          ),
        ),
      ),
    );
  }
}
