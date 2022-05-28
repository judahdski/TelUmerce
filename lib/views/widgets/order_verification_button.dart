import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/color_scheme.dart';
import '../utils/waiting_payment.dart';
import '../utils/waiting_payment_verification.dart';

class OrderConfirmationButton extends StatelessWidget {
  const OrderConfirmationButton(
      {Key? key, required this.text, required this.icon})
      : super(key: key);

  // parameter
  final String text;
  final IconData icon;

  // style
  final TextStyle titleText = const TextStyle(fontSize: 12.0, color: darkBlue);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 12.0, 14.0, 0),
      child: InkWell(
        onTap: () {
          Widget screen = (icon == FontAwesomeIcons.bagShopping)
              ? const WaitingPaymentScreen()
              : const WaitingPaymentVerificationScreen();

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
          decoration: BoxDecoration(
              border: Border.all(color: darkBlueShade300),
              borderRadius: BorderRadius.circular(6.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(icon, size: 14.0, color: darkBlue),
              const SizedBox(width: 14.0),
              Text(text, style: titleText)
            ],
          ),
        ),
      ),
    );
  }
}