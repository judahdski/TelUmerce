import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/categori.dart';
import 'package:telumerce/model/wishlist.dart';
import 'package:telumerce/services/wishlist/add_wishlist_services.dart';
import 'package:telumerce/services/wishlist/all_wishlist_services.dart';
import 'package:telumerce/services/wishlist/delete_wishlist_services.dart';

import '../../const/color_scheme.dart';
import '../../model/product.dart';
import '../../services/product/all_category_service.dart';
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

  final List _categories = [];
  int wishlistId = 0;

  var oCcy = NumberFormat("#,##0", "en_US");

  //function
  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  Future _checkWishlist() async {
    setStateIfMounted(() => isLoading = true);
    final response = await getAllWishlistService();

    if (response.isSuccessful) {
      List<Wishlist> listWishlist = response.data as List<Wishlist>;

      for (var wishlist in listWishlist) {
        if (wishlist.idProduk == widget.product.id) {
          setState(() {
            isFav = true;
          });
          wishlistId = wishlist.id;
        }
      }

      // TODO: SELESAIKAN MASALAH INI
      // YT : https://www.youtube.com/watch?v=t8LgA4zcW6M&list=PLxcvsYzLfaTCH6RNIr7PyLrEZRlP6uKhn&t=2681s
      // stackoverflow : https://stackoverflow.com/questions/63592887/fluttererror-setstate-called-after-dispose-lifecycle-state-defunct-not
      await Future.delayed(const Duration(milliseconds: 2));
      setStateIfMounted(() => isLoading = false);
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
      if(isFav) {
        var newWishlist = response.data as List<Wishlist>;
        wishlistId = newWishlist[0].id;
      }
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  Future _getAllCategories() async {
    final response = await getCategoriesService();

    if (response.isSuccessful) {
      _categories.addAll(response.data as List<Categori>);
    } else {
      //TODO: failed to get data
    }
  }

  String getCategoryName(int idCategory) {
    for (var categori in _categories) {
      if (categori.id == idCategory) {
        return categori.nameCategory;
      }
    }

    return '';
  }

  @override
  void initState() {
    super.initState();

    _getAllCategories();
    _checkWishlist();
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailProduct()));
      },
      child: Visibility(
        visible: isLoading,
        child: const Text('lagi loading'),
        replacement: LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            //regular card
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
                      child: Image.network(
                        'https://s4.bukalapak.com/img/4954929533/large/TUMBLER_STARBUCKS_RARE_LIMITED_EDITION_2.jpg',
                        fit: BoxFit.cover,
                      ),
                      // child: Image.network(
                      //   widget.product.gambarProduct,
                      //   fit: BoxFit.cover,
                      // ),
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
                                child: Text(
                                    getCategoryName(widget.product.idCategory),
                                    style: categoryText),
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
                                        //  TODO : Change isFav state
                                        //  TODO : Change the love icon color
                                        //  TODO : Add to the wishlist
                                        _setWishlist();
                                      },
                                      color: (isFav) ? Colors.red : Colors.grey,
                                      icon: (isFav)
                                          ? const FaIcon(
                                          FontAwesomeIcons.solidHeart)
                                          : const FaIcon(FontAwesomeIcons.heart)))
                            ],
                          ),

                          // Product name
                          Text(widget.product.productName,
                              style: bodyLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),

                          //Product price
                          Text('Rp. ${widget.product.harga}', style: labelLarge)
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
                        child: Image.network(
                          'https://s4.bukalapak.com/img/4954929533/large/TUMBLER_STARBUCKS_RARE_LIMITED_EDITION_2.jpg',
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(width: 14.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                getCategoryName(widget.product.idCategory),
                                style: categoryText),
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(4.0)),
                          ),

                          // Product name
                          Text(widget.product.productName,
                              style: bodyLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),

                          // Product price
                          Text('Rp. ${widget.product.harga}', style: labelLarge),
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
