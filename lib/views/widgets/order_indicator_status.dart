import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';
import '../../const/text_theme.dart';
import '../../model/status_order_enum.dart';

class OrderStatusIndicatorContainer extends StatelessWidget {
  const OrderStatusIndicatorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        smallMobile: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: const [
              ResponsiveLayout(
                smallMobile: Text(
                    'Pesanan anda akan diproses apabila pembayaran sudah terverifikasi',
                    style: bodySmall,
                    textAlign: TextAlign.center),
                mediumMobile: Text(
                    'Pesanan anda akan diproses apabila pembayaran sudah terverifikasi',
                    style: bodyMedium,
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 16.0),
              StatusIndicatorCard(),
            ],
          ),
        ),
        mediumMobile: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              ResponsiveLayout(
                smallMobile: Text(
                    'Pesanan anda akan diproses apabila pembayaran sudah terverifikasi',
                    style: bodySmall,
                    textAlign: TextAlign.center),
                mediumMobile: Text(
                    'Pesanan anda akan diproses apabila pembayaran sudah terverifikasi',
                    style: bodyMedium,
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 16.0),
              StatusIndicatorCard(),
            ],
          ),
        ));
  }
}

class StatusIndicatorCard extends StatelessWidget {
  const StatusIndicatorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000), offset: Offset(1, 2), blurRadius: 6.0)
          ]),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          StatusIndicator(
              icon: FontAwesomeIcons.scroll,
              text: 'Berhasil diverifikasi',
              status: StatusOrderEnum.verified),
          StatusIndicator(
              icon: FontAwesomeIcons.box,
              text: 'Sedang dikirim',
              status: StatusOrderEnum.packaging),
          StatusIndicator(
              icon: FontAwesomeIcons.truck,
              text: 'Sedang dikirim',
              status: StatusOrderEnum.delivered),
          StatusIndicator(
              icon: FontAwesomeIcons.house,
              text: 'Produk telah sampai',
              status: StatusOrderEnum.completed),
        ],
      ),
    );
  }
}

class StatusIndicator extends StatelessWidget {
  const StatusIndicator(
      {Key? key, required this.icon, required this.text, required this.status})
      : super(key: key);

  final IconData icon;
  final String text;
  final StatusOrderEnum status;

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
