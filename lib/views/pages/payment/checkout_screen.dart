import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../const/color_scheme.dart';
import '../../../const/text_theme.dart';
import '../../widgets/order_detail_card.dart';
import '../fragment/main_window.dart';
import 'payment_validation_screen.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  //style
  TextStyle headlineSmall = const TextStyle(fontSize: 24.0, color: darkBlue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const SizedBox(),
        title: const Text('Checkout', style: screenTitleText),
      ),
      body: Stack(
        children: [
          ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0),
            children: const [
              OrderDetail(),
              Divider(color: Color(0xfff2f2f2), thickness: 6.0, height: 6.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical:14.0, horizontal: 14.0),
                child: TimeCounter(),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: InfoBank(),
              ),
              SizedBox(height: 48.0),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 22.0, right: 22.0, bottom: 12.0),
              child: ElevatedButton(
                  onPressed: () {
                    //  Navigate to payment validation screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PaymentValidationScreen()));
                  },
                  child: const Text('Bayar')),
            ),
          )
        ],
      ),
    );
  }
}

class TimeCounter extends StatelessWidget {
  const TimeCounter({Key? key}) : super(key: key);

  //style
  final TextStyle timeLabel = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w600, color: Color(0xffe83232));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000), offset: Offset(1, 2), blurRadius: 6.0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Batas Akhir Pembayaran', style: bodySmall),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Minggu, 15 Mei 2022 20:37', style: labelSmall),
              Text('23:58:37', style: timeLabel),
            ],
          )
        ],
      ),
    );
  }
}

class InfoBank extends StatelessWidget {
  const InfoBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000), offset: Offset(1, 2), blurRadius: 6.0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Nomor rekening', style: bodySmall),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '8870881822773828',
                style: labelSmall,
              ),
              PasteButton(),
            ],
          ),
          const SizedBox(height: 12.0),
          const Text(
            'Total pembayaran',
            style: bodySmall,
          ),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Rp29.500',
                style: labelSmall,
              ),
              SizedBox(
                height: 16.0,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/2560px-Bank_Mandiri_logo_2016.svg.png',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PasteButton extends StatelessWidget {
  const PasteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'Salin',
          style: TextStyle(fontSize: 12.0, color: Color(0xff707070)),
        ),
        SizedBox(width: 2.0),
        FaIcon(
          FontAwesomeIcons.clipboard,
          size: 16.0,
          color: Color(0xff707070),
        )
      ],
    );
  }
}
