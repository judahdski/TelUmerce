import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../widgets/order_card.dart';

class WaitingPaymentScreen extends StatelessWidget {
  const WaitingPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 14.0),
        ),
        title: const Text('Menunggu pembayaran'),
      ),
      body: ResponsiveLayout(
          smallMobile: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 14.0),
            itemCount: 0,
            itemBuilder: (_, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: OrderCard(),
              );
            },
          ),
          mediumMobile: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
            itemCount: 0,
            itemBuilder: (_, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: OrderCard(),
              );
            },
          )),
    );
  }
}
