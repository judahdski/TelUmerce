import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/order_detail_card.dart';
import '../widgets/order_indicator_status.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({Key? key}) : super(key: key);

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
        title: const Text('Detail Pesanan'),
      ),
      body: ListView(
        children: const [
          OrderStatusIndicatorContainer(),
          Divider(
            thickness: 6.0,
            height: 6.0,
            color: Color(0xfff2f2f2),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: OrderDetail(),
          ),
        ],
      ),
    );
  }
}
