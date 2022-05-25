import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';

import '../../utils/edit_profile.dart';
import '../../utils/waiting_payment.dart';
import '../../utils/waiting_payment_verification.dart';
import '../../widgets/order_card.dart';
import 'main_window.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main-content
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: ListView(
            children: const [
              ProfileCard(),
              Divider(thickness: 6.0, height: 6.0, color: Color(0xfff2f2f2)),
              OrderConfirmationButton(
                  icon: FontAwesomeIcons.bagShopping,
                  text: "Menunggu pembayaran"),
              OrderConfirmationButton(
                  icon: FontAwesomeIcons.solidCircleCheck,
                  text: "Menunggu verifikasi"),
              OrderList()
            ],
          ),
        ),

        // Top-bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Color(0xffe1e1e1),
                  offset: Offset(0, 2),
                  blurRadius: 6.0)
            ]),
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: const Text('Keranjang',
                textAlign: TextAlign.center, style: screenTitleText),
          ),
        ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  //style
  final TextStyle nameText = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w600, color: darkBlue);
  final TextStyle subNameText =
      const TextStyle(fontSize: 12.0, color: Color(0xffe83232));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EditProfileScreen()));
        },
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        leading: const FaIcon(FontAwesomeIcons.circle, size: 45.0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Judah Joshua Martin Dasuki', style: nameText),
            const SizedBox(height: 4.0),
            Text('Edit profile >', style: subNameText)
          ],
        ),
      ),
    );
  }
}

class OrderConfirmationButton extends StatelessWidget {
  const OrderConfirmationButton(
      {Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  //style
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

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 14.0),
      child: Column(
        children: const [OrderCard()],
      ),
    );
  }
}
