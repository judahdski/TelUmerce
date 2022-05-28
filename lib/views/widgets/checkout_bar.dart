import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';

import '../../const/color_scheme.dart';
import '../pages/payment/checkout_screen.dart';

class CheckoutBar extends StatelessWidget {
  const CheckoutBar(
      {Key? key, required this.amountItem, required this.totalPrice})
      : super(key: key);

  // variable
  final int amountItem;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(1, 2),
                blurRadius: 6.0)
          ]),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Barang ($amountItem)', style: bodyMedium),
              Text('Rp $totalPrice', style: titleMedium),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(darkBlue)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutScreen()));
              },
              child: const Text('Checkout'))
        ],
      ),
    );
  }
}
