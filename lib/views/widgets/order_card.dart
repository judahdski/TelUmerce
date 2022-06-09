import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../utils/detail_order_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailOrderScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffcdcdcd)),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ResponsiveLayout(
          smallMobile: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.bagShopping,
                        size: 12.0,
                        color: darkBlue,
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Pesanan', style: bodySmall),
                          SizedBox(height: 4.0),
                          Text('14 Mei 2022', style: orderIdSmall),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      OrderStatus(),
                      SizedBox(height: 4.0),
                      Text('XaDS-1283-adSd', style: orderIdSmall),
                    ],
                  )
                ],
              ),
              const Divider(
                color: Color(0xffCDCDCD),
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Lihat detail pesanan', style: linkTextSmall),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text('Total belanja', style: bodySmall),
                      SizedBox(height: 4.0),
                      Text('Rp25.000', style: labelLarge),
                    ],
                  )
                ],
              ),
            ],
          ),
          mediumMobile: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.bagShopping,
                        size: 14.0,
                        color: darkBlue,
                      ),
                      const SizedBox(width: 14.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Pesanan', style: bodyMedium),
                          SizedBox(height: 5.0),
                          Text('14 Mei 2022', style: orderIdMedium),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      OrderStatus(),
                      SizedBox(height: 6.0),
                      Text('XaDS-1283-adSd', style: orderIdMedium),
                    ],
                  )
                ],
              ),
              const Divider(
                color: Color(0xffCDCDCD),
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Lihat detail pesanan', style: linkTextMedium),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text('Total belanja', style: bodyMedium),
                      SizedBox(height: 6.0),
                      Text('Rp25.000', style: titleMedium),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: const Color(0xffd11a2a),
      ),
      child: const ResponsiveLayout(
          smallMobile: Text('Gagal verifikasi', style: statusTextSmall),
          mediumMobile: Text('Gagal verifikasi', style: statusTextMedium)),
    );
  }
}
