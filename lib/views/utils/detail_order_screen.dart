import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/order_detail_card.dart';

class DetailOrderScreen extends StatefulWidget {
  const DetailOrderScreen({Key? key, required this.orderId}) : super(key: key);

  final int orderId;

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
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
        children: [
          // OrderStatusIndicatorContainer(),
          // Divider(
          //   thickness: 6.0,
          //   height: 6.0,
          //   color: Color(0xfff2f2f2),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OrderDetail(orderId: widget.orderId, deliveryMethod: 2),
            // child: OrderDetail(),
          ),
        ],
      ),
    );
  }
}
