import 'package:flutter/material.dart';
import 'package:telumerce/pages/main_window.dart';
import 'package:telumerce/utils/product_card.dart';
import 'package:telumerce/utils/wa_confirmation.dart';

class CartFragment extends StatelessWidget {
  const CartFragment({Key? key}) : super(key: key);

  //state
  final int amountItem = 1; //userCart.length (ret. from db)
  final int totalPrice = 25000; //total price (ret. from db)

  //style
  final TextStyle _checkoutText = const TextStyle(color: darkBlue);
  final TextStyle _productPrice = const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: darkBlue);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: ListView(
            padding: const EdgeInsets.only(top: 8.0, bottom: 140.0),
            children: const [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: ProductCard()),
            ],
          ),
        ),
        // Top-bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: const Text('Keranjang',
                textAlign: TextAlign.center, style: screenTitleText),
          ),
        ),
        // Checkout-bar
        Positioned(
          bottom: 16.0,
          left: 14.0,
          right: 14.0,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(1, 2),
                        blurRadius: 6.0)
                  ]),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Barang ($amountItem)', style: _checkoutText),
                      Text('Rp $totalPrice', style: _productPrice),
                    ],
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(darkBlue)),
                      onPressed: () {
                        //  Navigate to checkout screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ConfirmationScreen()));
                      },
                      child: const Text('Checkout'))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
