import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../utils/edit_profile.dart';
import '../../widgets/order_card.dart';
import '../../widgets/order_verification_button.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main-content
        Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          bottom: 0,
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
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopBar(text: 'Profil'),
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()));
        },
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        leading: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
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
