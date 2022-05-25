import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';

import '../widgets/order_detail_card.dart';

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
          OrderStatusIndicator(),
          Divider(thickness: 6.0,height: 6.0, color: Color(0xfff2f2f2),),
          Padding(
            padding: EdgeInsets.all(8.0),
            // TODO: perbaiki tampilan(di xd) order detail biar reusable
            child: OrderDetail(),
          ),
        ],
      ),
    );
  }
}

class OrderStatusIndicator extends StatelessWidget {
  const OrderStatusIndicator({Key? key}) : super(key: key);

  //style
  final TextStyle statusMessage = const TextStyle(fontSize: 12.0, color: Color(0xff707070));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Text('Pesanan anda akan diproses apabila pembayaran sudah terverifikasi', style: statusMessage, textAlign: TextAlign.center),
          const SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              boxShadow: const [
                BoxShadow(color: Color(0xfff9f9f9), offset: Offset(1, 2), blurRadius: 6.0)
              ]
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 36.0,
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.scroll, color: darkBlue),
                      SizedBox(height: 6.0),
                      Text('Menunggu verifikasi', textAlign: TextAlign.center, style: TextStyle(fontSize: 6.0),)
                    ],
                  ),
                ),
                SizedBox(
                  width: 36.0,
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.box, color: darkBlue),
                      SizedBox(height: 6.0),
                      Text('Sedang dikemas', textAlign: TextAlign.center, style: TextStyle(fontSize: 6.0),)
                    ],
                  ),
                ),
                SizedBox(
                  width: 36.0,
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.truck, color: darkBlue),
                      SizedBox(height: 6.0),
                      Text('Sedang dikirim', textAlign: TextAlign.center, style: TextStyle(fontSize: 6.0),)
                    ],
                  ),
                ),
                SizedBox(
                  width: 36.0,
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.house, color: darkBlueShade300),
                      SizedBox(height: 6.0),
                      Text('Produk telah sampai', textAlign: TextAlign.center, style: TextStyle(fontSize: 6.0),)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

