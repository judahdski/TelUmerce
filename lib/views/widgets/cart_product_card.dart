import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/controller/get_category_controller.dart';
import 'package:telumerce/model/product.dart';
import 'package:telumerce/services/cart/all_cart_services.dart';
import 'package:telumerce/services/cart/delete_cart_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../const/color_scheme.dart';
import '../../const/text_theme.dart';
import '../../model/cart.dart';

class CartProductCard extends StatefulWidget {
  const CartProductCard({Key? key, required this.cartItemId}) : super(key: key);

  final int cartItemId;

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  var oCcy = NumberFormat("#,##0", "en_US");
  
  bool isLoading = false;
  String category = '';
  String namaBarang = '';
  String gambar = '';
  int jumlahProduct = 0;
  int hargaProduct = 0;
  int totalHarga = 0;

  final List<CartItem> _cartItems = [];
  CartItem? cartItem;
  Product? product;

  Future _getCartItem() async {
      for (var cartItem in _cartItems) {
        if (cartItem.id == widget.cartItemId) {
          this.cartItem = cartItem;
        }
      }
  }

  Future _getCartItems() async {
    final response = await getCartService();
    var cart = response.data as Cart;
    List<CartItem> cartItems = cart.cartItem;

    if (response.isSuccessful) {
      _cartItems.addAll(cartItems);
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  Future _setUIState() async {
    product = cartItem!.produk;
    jumlahProduct = cartItem!.jumlahBarang;
    category = await getCategoryNameController(product!.idCategory);
    gambar = product!.gambarProduct;
    namaBarang = product!.productName;
    hargaProduct = product!.harga;
    totalHarga = _setProductPrice();
  }

  int _setProductPrice() {
    return jumlahProduct * hargaProduct;
  }

  Future _deleteCartProduct(int id) async {
    final response = await deleteCartService(id);

    if (response.isSuccessful) {
      var successMsg = response.data as String;
      var snackbar = SnackBar(content: Text(successMsg));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {}
  }

  Future _loadCartProductCard() async {
    setState(() => isLoading = true);

    await _getCartItems();
    await _getCartItem();
    await _setUIState();

    await Future.delayed(const Duration(milliseconds: 2));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadCartProductCard();
  }

  @override
  void setState(VoidCallback fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: Container(
        height: 120.0,
        color: const Color(0xffe5e5e5),
      ),
      replacement: Container(
        height: 120.0,
        padding:
        const EdgeInsets.only(left: 6.0, top: 8.0, bottom: 8.0, right: 6.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xffcdcdcd), width: .75),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: [
            SizedBox(
                width: 94.0,
                child: CachedNetworkImage(
                  imageUrl:'https://telyu-ecommerce.herokuapp.com/img_produk/$gambar',
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 14.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //  Category card
                      Container(
                        child: Text(category, style: categoryText),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(4.0)),
                      ),

                      // Like button
                      SizedBox(
                          width: 28.0,
                          height: 28.0,
                          child: IconButton(
                              padding: const EdgeInsets.all(6.0),
                              iconSize: 16.0,
                              onPressed: () {
                                _deleteCartProduct(widget.cartItemId);
                              },
                              icon: const FaIcon(FontAwesomeIcons.xmark)))
                    ],
                  ),

                  // Product name
                  Text('$namaBarang   ($jumlahProduct x)',
                      style: bodyLarge, overflow: TextOverflow.ellipsis),

                  //Product price
                  Text('Rp ${oCcy.format(totalHarga)}', style: labelLarge),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
