import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';

import '../utils/detail_order_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  //style
  final TextStyle regText = const TextStyle(fontSize: 12.0, color: darkBlue);
  final TextStyle linkText = const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w600, color: Color(0xff19d619));
  final TextStyle orderId = const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w600, color: Color(0xff666677));
  final TextStyle productName = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Color(0xff000000));
  final TextStyle productPrice = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: darkBlue);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailOrderScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffcdcdcd)),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FaIcon(FontAwesomeIcons.bagShopping, size: 16.0, color: darkBlue,),
                    const SizedBox(width: 14.0),
                    Column(
                      children: [
                        Text('Pesanan', style: regText),
                        const SizedBox(height: 4.0),
                        Text('14 Mei 2022', style: orderId),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const OrderStatus(),
                    const SizedBox(height: 2.0),
                    Text('011', style: orderId),
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
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Tumbler', style: productName, overflow: TextOverflow.ellipsis, maxLines: 1),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Text('Total belanja', style: regText),
                     const SizedBox(height: 4.0),
                     Text('Rp25.000', style: productPrice),
                   ],
                 )
               ],
            ),
            Text('Lihat detail pesanan', style: linkText)
          ],
        ),
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key}) : super(key: key);

  //style
  final TextStyle title = const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w600, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: const Color(0xffd11a2a),
      ),
      child: Text('Gagal verifikasi', style: title),
    );
  }
}

