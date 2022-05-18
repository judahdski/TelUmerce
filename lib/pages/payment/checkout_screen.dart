import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/pages/main_window.dart';
import 'package:telumerce/pages/payment/payment_validation_screen.dart';

import '../../const/color_scheme.dart';
import '../../const/text_theme.dart';

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
        leading: IconButton(
          onPressed: () {},
          splashRadius: 24.0,
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
        ),
        title: const Text('Checkout', style: screenTitleText),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                splashRadius: 24.0,
                icon: const FaIcon(FontAwesomeIcons.cartShopping)),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 14.0),
            children: const [
              Text('Detail pesanan', style: titleSmall),
              SizedBox(height: 16.0),
              OrderDetail(),
              SizedBox(height: 24.0),
              TimeCounter(),
              SizedBox(height: 8.0),
              InfoBank(),
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

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  //style
  final TextStyle priceLabel = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w600, color: Color(0xffe83232));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Tumbler', style: labelLarge),
              Text('Rp25.000', style: labelSmall)
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Ongkos kirim',
                style: bodySmall,
              ),
              Text(
                'Rp4.500',
                style: labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          const Text(
            'Alamat penerima',
            style: labelSmall,
          ),
          const SizedBox(height: 6.0),
          const Text(
            'Komplek konoha Jl.Kebon akatsuki no.14 Kec. Benteng rose, kab.marley, Paradise, 45218',
            style: bodySmall,
          ),
          const Divider(color: darkBlueShade300, height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Harga produk',
                style: bodySmall,
              ),
              Text('Rp25.000', style: bodySmall),
            ],
          ),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Ongkos kirim', style: bodySmall),
              Text('Rp4.500', style: bodySmall),
            ],
          ),
          const Divider(color: darkBlueShade300, height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total bayar', style: labelSmall),
              Text('Rp29.500', style: priceLabel),
            ],
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
