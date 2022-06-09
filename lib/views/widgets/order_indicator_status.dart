import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';
import '../../const/text_theme.dart';
import '../../model/dummy/status_order.dart';

class OrderStatusIndicator extends StatelessWidget {
  const OrderStatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          const Text(
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
              children: const [
                OrderStatus(
                    icon: FontAwesomeIcons.toiletPaper,
                    text: 'Berhasil diverifikasi',
                    status: StatusOrder.verified),
                OrderStatus(
                    icon: FontAwesomeIcons.box,
                    text: 'Sedang dikirim',
                    status: StatusOrder.packaging),
                OrderStatus(
                    icon: FontAwesomeIcons.truck,
                    text: 'Sedang dikirim',
                    status: StatusOrder.delivered),
                OrderStatus(
                    icon: FontAwesomeIcons.house,
                    text: 'Produk telah sampai',
                    status: StatusOrder.completed),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus(
      {Key? key, required this.icon, required this.text, required this.status})
      : super(key: key);

  final IconData icon;
  final String text;
  final StatusOrder status;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        smallMobile: SizedBox(
          width: 56,
          child: Column(
            children: [
              FaIcon(icon, color: darkBlue, size: 18.0),
              const SizedBox(height: 6.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 8.0),
              )
            ],
          ),
        ),
        mediumMobile: SizedBox(
          width: 64,
          child: Column(
            children: [
              // TODO: ubah agar menyesuaikan dengan state saat ini
              FaIcon(icon, color: darkBlue, size: 20.0),
              const SizedBox(height: 10.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10.0),
              )
            ],
          ),
        ));
  }
}
