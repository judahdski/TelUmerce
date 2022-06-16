import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import 'checkout_screen.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const SizedBox(),
        title: const Text('Checkout', style: titleMedium),
      ),
      body: ListView(
        children: [
          const DeliveryOptions(),
          const Divider(height: 6.0, thickness: 6.0, color: Color(0xfff0f0f0)),
          const PaymentOptions(),
          const Divider(height: 6.0, thickness: 6.0, color: Color(0xfff0f0f0)),
          const AddressInput(),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
            child: ElevatedButton(
                onPressed: () {
                  //  TODO: update address if address changed
                  //  TODO: navigate to checkout screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckoutScreen()));
                },
                child: const Text('Lanjutkan')),
          )
        ],
      ),
    );
  }
}

// TODO: APUS SEMUA BG COLOR YANG WARNA PUTIH

class DeliveryOptions extends StatefulWidget {
  const DeliveryOptions({Key? key}) : super(key: key);

  @override
  State<DeliveryOptions> createState() => _DeliveryOptionsState();
}

class _DeliveryOptionsState extends State<DeliveryOptions> {
  bool isDeliver = true;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallMobile: Container(
        padding: const EdgeInsets.all(14.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Metode pengiriman', style: titleSmall),
            const SizedBox(height: 12.0),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  style: TextStyle(fontSize: 12.0, color: Color(0xff666677)),
                  children: [
                    TextSpan(
                        text:
                            'Kamu harus mengambil langsung barang yang sudah kamu beli di Universitas Telkom.\n'),
                    TextSpan(
                        text: 'atau\n',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text:
                            'Kamu juga bisa menggunakan jasa kirim namun akan dikenakan tarif pengiriman.'),
                  ]),
            ),
            const SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Barang mau diantar?', style: bodySmall),
                Switch(
                  value: isDeliver,
                  onChanged: (_) {
                    setState(() {
                      isDeliver = !isDeliver;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      mediumMobile: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Metode pengiriman', style: titleSmall),
            const SizedBox(height: 12.0),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                    fontSize: 14.0, color: Color(0xff666677), height: 1.55),
                children: [
                  TextSpan(
                      text:
                          'Kamu harus mengambil langsung barang yang sudah kamu beli di Universitas Telkom.\n'),
                  TextSpan(
                      text: 'atau\n',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  TextSpan(
                      text:
                          'Kamu juga bisa menggunakan jasa kirim namun akan dikenakan tarif pengiriman.'),
                ],
              ),
            ),
            const SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Barang mau diantar?', style: bodyMedium),
                Switch(
                  value: isDeliver,
                  onChanged: (_) {
                    setState(() {
                      isDeliver = !isDeliver;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  String paymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallMobile: Container(
        padding: const EdgeInsets.all(14.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Metode pengiriman', style: titleSmall),
            paymentMethodOptions(
              value: 'transfer_bank',
              label: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.moneyBill,
                      color: Color(0xff666677), size: 16.0),
                  SizedBox(width: 8.0),
                  Text(
                    'Transfer bank',
                    style: TextStyle(fontSize: 12.0, color: Color(0xff666677)),
                  ),
                ],
              ),
            ),
            paymentMethodOptions(
              value: 'linkaja',
              label: SizedBox(
                height: 32.0,
                child: Image.network(
                    'https://harianrakyataceh.com/wp-content/uploads/2021/07/beli-saldo-paypal-via-linkaja.png'),
              ),
            )
          ],
        ),
      ),
      mediumMobile: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Metode pengiriman', style: titleSmall),
            paymentMethodOptions(
              value: 'transfer_bank',
              label: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.moneyBill,
                      color: Color(0xff666677), size: 18.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Transfer bank',
                    style: TextStyle(fontSize: 14.0, color: Color(0xff666677)),
                  ),
                ],
              ),
            ),
            paymentMethodOptions(
              value: 'linkaja',
              label: SizedBox(
                height: 36.0,
                child: Image.network(
                    'https://harianrakyataceh.com/wp-content/uploads/2021/07/beli-saldo-paypal-via-linkaja.png'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row paymentMethodOptions({required String value, required Widget label}) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: paymentMethod,
            onChanged: (value) {
              setState(() {
                paymentMethod = value.toString();
              });
            }),
        const SizedBox(width: 8.0),
        label
      ],
    );
  }
}

class AddressInput extends StatefulWidget {
  const AddressInput({Key? key}) : super(key: key);

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  final TextEditingController _controller = TextEditingController();
  bool isSameAsProfile = false;

  @override
  void initState() {
    super.initState();

    _controller.text = 'Helloo';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Alamat penerima', style: titleSmall),
          const SizedBox(height: 14.0),
          Visibility(
            visible: isSameAsProfile,
            child: TextField(
              enabled: false,
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: darkBlueShade300),
                      borderRadius: BorderRadius.circular(6.0))),
            ),
            replacement: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: darkBlueShade300),
                    borderRadius: BorderRadius.circular(6.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffcdcdcd)),
                    borderRadius: BorderRadius.circular(6.0)),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Alamat sesuai profil'),
              SizedBox(
                height: 32.0,
                child: Switch(
                    value: isSameAsProfile,
                    onChanged: (bool value) {
                      //  TODO: make the textfield disabled
                      setState(() {
                        isSameAsProfile = value;
                      });
                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }
}
