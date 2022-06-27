import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/services/cart/add_cart_services.dart';
import 'package:telumerce/services/product/detail_product_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';
import '../../model/product.dart';
import '../pages/fragment/main_window.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key, required this.idProduct}) : super(key: key);

  final int idProduct;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  //      S T A T E
  int idProduct = 0;
  String productName = '';
  String image = '';

  int amount = 0;
  int basePrice = 0;
  int currentPrice = 0;
  bool isLoading = false;

  final oCcy = NumberFormat("#,##0", "en_US");
  Product? detailProduct;

  //       F U N C T I O N
  _increaseAmount() {
    setState(() {
      if (amount >= 10) return;

      amount++;
      currentPrice = basePrice * amount;
    });
  }

  _decreaseAmount() {
    // TODO : Check if isCartCard is true or false
    // TODO : if true then update the amount of product and the price
    if (amount <= 1) return;

    setState(() {
      amount--;
      currentPrice = basePrice * amount;
    });
  }

  Future _addCart(String productAmount, int id) async {
    final response = await addCartService(productAmount, id);

    if (response.isSuccessful) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MainWindow(1)));
    } else {
      print(response.errorMessage);
    }
  }

  Future _getProductDetail() async {
    setState(() => isLoading = true);
    final response = await getProductDetailService(widget.idProduct);

    if (response.isSuccessful) {
      var product = response.data as Product;
      detailProduct = product;
      _setUIState();

      await Future.delayed(const Duration(milliseconds: 10));
      setState(() => isLoading = false);
    } else {}
  }

  void _setUIState() {
    idProduct = detailProduct!.id;
    productName = detailProduct!.productName;
    basePrice = detailProduct!.harga;
    image = detailProduct!.gambarProduct;

    amount = 1;
    currentPrice = basePrice;
  }

  @override
  void initState() {
    super.initState();

    _getProductDetail();
  }

  //       U I
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            splashRadius: 24.0,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: 14.0,
              color: darkBlue,
            )),
        title: const Text('Produk'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainWindow(1),
                  ),
                );
              },
              splashRadius: 24.0,
              icon: const FaIcon(
                FontAwesomeIcons.cartShopping,
                size: 14.0,
                color: darkBlue,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Visibility(
              visible: isLoading,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: const Color(0xffe5e5e5),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              replacement: Image.network(
                'https://telyu-ecommerce.herokuapp.com/img_produk/$image',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: ResponsiveLayout(
              smallMobile: Container(
                margin: const EdgeInsets.only(
                    top: 8.0, left: 14.0, right: 14.0, bottom: 24.0),
                height: 180.0,
                decoration: BoxDecoration(
                  color: const Color(0xffe5e5e5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              mediumMobile: Container(
                margin: const EdgeInsets.only(
                    top: 8.0, left: 14.0, right: 14.0, bottom: 24.0),
                height: 190.0,
                decoration: BoxDecoration(
                  color: const Color(0xffe5e5e5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            replacement: ResponsiveLayout(
              smallMobile: Container(
                height: 180.0,
                padding: const EdgeInsets.only(
                    left: 14.0, right: 14.0, bottom: 24.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(1, 2),
                            blurRadius: 6.0)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productName,
                              overflow: TextOverflow.ellipsis,
                              style: titleMedium),
                          const SizedBox(width: 8.0),
                          const Text('Stok tersedia',
                              style: productNameSubTextSmall),
                        ],
                      ),
                      priceCounterWidget(),
                      ElevatedButton(
                        onPressed: () {
                          _addCart(amount.toString(), idProduct);
                        },
                        child: const Text('Tambah'),
                      )
                    ],
                  ),
                ),
              ),
              mediumMobile: Container(
                height: 190.0,
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 24.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(1, 2),
                            blurRadius: 6.0)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: titleLarge),
                          const SizedBox(width: 8.0),
                          const Text('Stok tersedia',
                              style: productNameSubTextMedium),
                        ],
                      ),
                      priceCounterWidget(),
                      ElevatedButton(
                        onPressed: () {
                          _addCart(amount.toString(), idProduct);
                        },
                        child: const Text('Tambah'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // support widget
  Widget priceCounterWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ResponsiveLayout(
          smallMobile: SizedBox(
            width: 90,
            child: Text(
              'Rp ${oCcy.format(currentPrice)}',
              style: labelLarge,
            ),
          ),
          mediumMobile: SizedBox(
            width: 140,
            child: Text(
              'Rp ${oCcy.format(currentPrice)}',
              style: titleMedium,
            ),
          ),
        ),
        Container(
          width: 100.0,
          height: 38.0,
          decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    _decreaseAmount();
                  },
                  child: const Text(
                    '-',
                    textAlign: TextAlign.center,
                    style: minusText,
                  ),
                ),
              ),
              // Amount of the product's
              Expanded(
                child: Text(
                  amount.toString(),
                  textAlign: TextAlign.center,
                  style: titleSmall,
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    _increaseAmount();
                  },
                  child: const Text(
                    '+',
                    textAlign: TextAlign.center,
                    style: plusText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
