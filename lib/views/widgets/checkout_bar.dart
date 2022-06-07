import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/pages/payment/payment_options_screen.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';

class CheckoutBar extends StatelessWidget {
  const CheckoutBar(
      {Key? key, required this.amountItem, required this.totalPrice})
      : super(key: key);

  // variable
  final int amountItem;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        smallMobile: Container(
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
                        MaterialPageRoute(
                            builder: (context) =>
                                const PaymentOptionsScreen()));
                  },
                  child: const Text('Checkout'))
            ],
          ),
        ),
        mediumMobile: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(1, 2),
                    blurRadius: 6.0)
              ]),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Barang ($amountItem)', style: bodyLarge),
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
                        MaterialPageRoute(
                            builder: (context) =>
                                const PaymentOptionsScreen()));
                  },
                  child: const Text('Checkout'))
            ],
          ),
        ));
  }
}
