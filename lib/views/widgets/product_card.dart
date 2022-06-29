import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/controller/get_category_controller.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/wishlist.dart';
import 'package:telumerce/services/wishlist/add_wishlist_services.dart';
import 'package:telumerce/services/wishlist/all_wishlist_services.dart';
import 'package:telumerce/services/wishlist/delete_wishlist_services.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../const/color_scheme.dart';
import '../../model/product.dart';
import '../utils/detail_product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  //variable
  bool isFav = false;
  bool isLoading = false;

  String categoryName = 'null';
  int wishlistId = 0;

  var oCcy = NumberFormat("#,##0", "en_US");

  //function
  Future _checkWishlist() async {
    final response = await getAllWishlistService();

    if (response.isSuccessful) {
      List<Wishlist> listWishlist = response.data as List<Wishlist>;

      for (var wishlist in listWishlist) {
        if (wishlist.idProduk == widget.product.id) {
          setState(() => isFav = true);
          wishlistId = wishlist.id;
        }
      }
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  Future _setWishlist() async {
    if (isFav) {
      setState(() => isFav = false);
    } else {
      setState(() => isFav = true);
    }

    ApiResponse response = ApiResponse();
    if (isFav) {
      response = await addWishlist(widget.product.id);
    } else {
      setState(() => isFav = false);
      response = await deleteWishlist(wishlistId);
    }

    if (response.isSuccessful) {
      if (isFav) {
        var newWishlist = response.data as List<Wishlist>;
        wishlistId = newWishlist[0].id;
      }
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  Future _loadProductCard() async {
    setState(() => isLoading = true);

    categoryName = await getCategoryNameController(widget.product.idCategory);
    await _checkWishlist();

    await Future.delayed(const Duration(milliseconds: 2));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadProductCard();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailProduct(idProduct: widget.product.id);
        }));
      },
      child: Visibility(
        visible: isLoading,
        child: LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            if (constraints.maxWidth < 900) {
              return Container(
                height: 120.0,
                decoration: BoxDecoration(
                    color: const Color(0xffe5e5e5),
                    borderRadius: BorderRadius.circular(8.0)),
              );
            } else {
              return Container(
                width: 300.0,
                height: 120.0,
                decoration: BoxDecoration(
                    color: const Color(0xffe5e5e5),
                    borderRadius: BorderRadius.circular(8.0)),
              );
            }
          },
        ),
        replacement: LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            if (constraints.maxWidth < 900) {
              return Container(
                height: 120.0,
                padding: const EdgeInsets.only(
                    left: 6.0, top: 8.0, bottom: 8.0, right: 6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xffcdcdcd), width: .75),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    // TODO: blum bisa nampilin gambar dari api
                    SizedBox(
                      width: 94.0,
                      child: CachedNetworkImage(
                        imageUrl:'$baseImageURL${widget.product.gambarProduct}',
                        fit: BoxFit.contain,
                      ),
                    ),

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
                                child: Text(categoryName, style: categoryText),
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
                                        _setWishlist();
                                      },
                                      color: (isFav) ? Colors.red : Colors.grey,
                                      icon: (isFav)
                                          ? const FaIcon(
                                              FontAwesomeIcons.solidHeart)
                                          : const FaIcon(
                                              FontAwesomeIcons.heart)))
                            ],
                          ),
                          Text(widget.product.productName,
                              style: bodyLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          Text('Rp. ${oCcy.format(widget.product.harga)}',
                              style: labelLarge)
                        ],
                      ),
                    )
                  ],
                ),
              );
              //  side scrollview card
            } else {
              return Container(
                height: 120.0,
                width: 300.0,
                padding: const EdgeInsets.only(
                    left: 6.0, top: 8.0, bottom: 8.0, right: 6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xffcdcdcd), width: .75),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 94.0,
                      child: CachedNetworkImage(
                        imageUrl:'$baseImageURL${widget.product.gambarProduct}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(categoryName, style: categoryText),
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                          Text(widget.product.productName,
                              style: bodyLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          Text('Rp. ${oCcy.format(widget.product.harga)}',
                              style: labelLarge),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
