import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/model/create_order.dart';
import 'package:telumerce/model/payment_info.dart';
import 'package:telumerce/services/order/create_order_services.dart';
import 'package:telumerce/services/payment/info_payment_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import 'checkout_screen.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  bool isLoading = false;

  // ------------------------ metode pengiriman state
  bool isDeliver = true;

  // ------------------------ metode pembayaran state
  String paymentMethod = '';

  // ------------------------ alamat state
  String alamat = 'null';
  final TextEditingController _addressTextInputContoller = TextEditingController();
  bool isSameAsProfile = false;

  PaymentInfo? paymentInfo;

  Future _getPaymentInfo() async {
    final response = await getInfoPaymentService();

    if (response.isSuccessful) {
      paymentInfo = response.data as PaymentInfo;
    } else {
      if (kDebugMode) {
        print(response.errorMessage);
      }
    }
  }

  void setPaymentMethod(String value) {
    setState(() => paymentMethod = value);
  }

  void setAddressState() {
    setState(() => isSameAsProfile = !isSameAsProfile);
  }

  _setUIState() {
    alamat = paymentInfo!.user;
    _addressTextInputContoller.text = alamat;
  }

  int _getDeliveryMethod() {
    if (isDeliver) {
      return 2;
    }

    return 1;
  }

  int _getPaymentMethod() {
    return 1;
  }

  String _getAddress() {
    if (isSameAsProfile) {
      return alamat;
    } else {
      return _addressTextInputContoller.text;
    }
  }

  Future _createOrder() async {
    String msg = '';
    final response = await createOrderService(
        _getAddress(), _getDeliveryMethod(), _getPaymentMethod());

    if (response.isSuccessful) {
      msg = 'Berhasil';
      var order = response.data as CreateOrder;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CheckoutScreen(orderId: order.id, deliveryMethod: _getDeliveryMethod())));
    } else {
      msg = 'Gagal, karena ${response.errorMessage}';
    }

    var snackbar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future _loadPaymentOptionsScreen() async {
    setState(() => isLoading = true);

    await _getPaymentInfo();
    await _setUIState();

    await Future.delayed(const Duration(milliseconds: 2));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadPaymentOptionsScreen();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Checkout', style: titleMedium),
      ),
      body: Visibility(
        visible: isLoading,
        child: const Center(child: CircularProgressIndicator()),
        replacement: ListView(
          children: [
            deliveryOptionsWidget(),
            const Divider(
                height: 6.0, thickness: 6.0, color: Color(0xfff0f0f0)),
            paymentOptionsWidget(),
            const Divider(
                height: 6.0, thickness: 6.0, color: Color(0xfff0f0f0)),
            AddressInputWidget(
              setAddressState: () {
                setAddressState();
              },
              textInputController: _addressTextInputContoller,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              child: ElevatedButton(
                  onPressed: () {
                    _createOrder();
                  },
                  child: const Text('Lanjutkan')),
            )
          ],
        ),
      ),
    );
  }

  Widget deliveryOptionsWidget() {
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

  Widget paymentOptionsWidget() {
    return ResponsiveLayout(
      smallMobile: Container(
        padding: const EdgeInsets.all(14.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Metode pembayaran', style: titleSmall),
            const Text(
                'Untuk sementara metode pembayaran hanya bisa dilakukan melalui transfer bank saja.',
                style: bodySmall),
            PaymentMethodOptions(
              initValue: 'transfer_bank',
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
              paymentMethod: paymentMethod,
              setPaymentMethod: () {
                var value = 'transfer_bank';
                setPaymentMethod(value);
              },
            ),
            PaymentMethodOptions(
              initValue: 'linkaja',
              label: SizedBox(
                height: 32.0,
                child: CachedNetworkImage(
                    imageUrl: 'https://harianrakyataceh.com/wp-content/uploads/2021/07/beli-saldo-paypal-via-linkaja.png'),
              ),
              paymentMethod: paymentMethod,
              setPaymentMethod: () {
                var value = 'linkaja';
                setPaymentMethod(value);
              },
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
            const Text('Metode pembayaran', style: titleSmall),
            const Text(
                'Untuk sementara metode pembayaran hanya bisa dilakukan melalui transfer bank saja.',
                style: bodySmall),
            PaymentMethodOptions(
              initValue: 'transfer_bank',
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
              paymentMethod: paymentMethod,
              setPaymentMethod: () {
                var value = 'transfer_bank';
                setPaymentMethod(value);
              },
            ),
            PaymentMethodOptions(
              initValue: 'linkaja',
              label: SizedBox(
                height: 36.0,
                child: CachedNetworkImage(
                    imageUrl: 'https://harianrakyataceh.com/wp-content/uploads/2021/07/beli-saldo-paypal-via-linkaja.png'),
              ),
              paymentMethod: paymentMethod,
              setPaymentMethod: () {
                var value = 'linkaja';
                setPaymentMethod(value);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _addressTextInputContoller.dispose();
  }
}

// TODO: ubah widget function jadi widget class

class PaymentMethodOptions extends StatelessWidget {
  const PaymentMethodOptions({Key? key, required this.setPaymentMethod, required this.initValue, required this.paymentMethod, required this.label}) : super(key: key);

  final VoidCallback setPaymentMethod;
  final String initValue;
  final String paymentMethod;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: initValue,
          groupValue: paymentMethod,
          onChanged: (value) {
            setPaymentMethod();
          },
        ),
        const SizedBox(width: 8.0),
        label
      ],
    );
  }
}

class AddressInputWidget extends StatefulWidget {
  const AddressInputWidget({Key? key, required this.textInputController, required this.setAddressState}) : super(key: key);

  final TextEditingController textInputController;
  final VoidCallback setAddressState;

  @override
  State<AddressInputWidget> createState() => _AddressInputWidgetState();
}

class _AddressInputWidgetState extends State<AddressInputWidget> {
  bool isSameAsProfile = false;

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
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: darkBlueShade300),
                      borderRadius: BorderRadius.circular(6.0))),
            ),
            replacement: TextField(
              controller: widget.textInputController,
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
                      setState(() => isSameAsProfile = value);
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
