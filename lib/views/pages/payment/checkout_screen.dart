import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';

import '../../widgets/bank_info_card.dart';
import '../../widgets/order_detail_card.dart';
import '../../widgets/payment_countdown_timer.dart';
import 'payment_validation_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const SizedBox(),
        title: const Text('Checkout', style: titleMedium),
      ),
      body: Stack(
        children: [
          // Main-content
          ListView(
            padding: const EdgeInsets.only(bottom: 80.0),
            children: const [
              OrderDetail(),
              Divider(color: Color(0xfff2f2f2), thickness: 6.0, height: 6.0),
              TimeCounter(),
              BankInfoCard(),
            ],
          ),

          // Payment button
          Positioned(
            bottom: 16.0,
            left: 14.0,
            right: 14.0,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PaymentValidationScreen()));
                },
                child: const Text('Bayar')),
          )
        ],
      ),
    );
  }
}
