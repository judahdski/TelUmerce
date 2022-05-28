import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/color_scheme.dart';

class OrderStatusIndicator extends StatelessWidget {
  const OrderStatusIndicator({Key? key}) : super(key: key);

  //style
  final TextStyle statusMessage =
      const TextStyle(fontSize: 12.0, color: Color(0xff707070));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Text(
              'Pesanan anda akan diproses apabila pembayaran sudah terverifikasi',
              style: statusMessage,
              textAlign: TextAlign.center),
          const SizedBox(height: 16.0),
          Container(
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
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 36.0,
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.scroll, color: darkBlue),
                      SizedBox(height: 6.0),
                      Text(
                        'Menunggu verifikasi',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 6.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 36.0,
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.box, color: darkBlue),
                      SizedBox(height: 6.0),
                      Text(
                        'Sedang dikemas',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 6.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 36.0,
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.truck, color: darkBlue),
                      SizedBox(height: 6.0),
                      Text(
                        'Sedang dikirim',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 6.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 36.0,
                  child: Column(
                    children: const [
                      FaIcon(FontAwesomeIcons.house, color: darkBlueShade300),
                      SizedBox(height: 6.0),
                      Text(
                        'Produk telah sampai',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 6.0),
                      )
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
