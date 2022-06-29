import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/services/user/get_user_services.dart';
import 'package:telumerce/services/utils/helper_method.dart';
import 'package:telumerce/views/pages/payment/payment_options_screen.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/utils/edit_profile.dart';

import '../../const/color_scheme.dart';
import '../../model/user.dart';

class CheckoutBar extends StatefulWidget {
  const CheckoutBar(
      {Key? key, required this.amountItem, required this.totalPrice, required this.isListEmpty})
      : super(key: key);

  // variable
  final int amountItem;
  final int totalPrice;
  final bool isListEmpty;

  @override
  State<CheckoutBar> createState() => _CheckoutBarState();
}

class _CheckoutBarState extends State<CheckoutBar> {
  bool isUserInfoNull = true;

  var oCcy = NumberFormat("#,##0", "en_US");

  Future _checkUserInfo() async {
    final response = await getUserService();

    if (response.isSuccessful) {
      var user = response.data as User;

      if (user.alamat == null && user.noTelp == null) {
        isUserInfoNull = true;
      } else {
        isUserInfoNull = false;
      }
    } else {
      createErrorSnackbar(context, response);
    }
  }

  Future _showMyDialog(BuildContext ctx) async {
    return showDialog<void>(
      context: ctx,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alamat dan nomor hp masih kosong.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Daftarkan alamat dan nomor hp terlebih dahulu.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tidak jadi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Daftarkan'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  Future _setCheckoutButton() async {
    await _checkUserInfo();

    if (isUserInfoNull) {
      _showMyDialog(context);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const PaymentOptionsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        smallMobile: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(1, 2),
                    blurRadius: 6.0)
              ]),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Barang (${widget.amountItem})', style: bodyMedium),
                  Text('Rp ${oCcy.format(widget.totalPrice)}', style: titleMedium),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(darkBlue)),
                  onPressed: () {
                    if (!widget.isListEmpty) {
                      _setCheckoutButton();
                    }
                  },
                  child: const Text('Checkout'))
            ],
          ),
        ),
        mediumMobile: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(1, 2),
                    blurRadius: 6.0)
              ]),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Barang (${widget.amountItem})', style: bodyLarge),
                  Text('Rp ${oCcy.format(widget.totalPrice)}', style: titleMedium),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(darkBlue)),
                  onPressed: () {
                    if (!widget.isListEmpty) {
                      _setCheckoutButton();
                    }
                  },
                  child: const Text('Checkout'))
            ],
          ),
        ));
  }
}
