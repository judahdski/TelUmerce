import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../utils/edit_profile.dart';
import '../../widgets/order_card.dart';
import '../../widgets/order_verification_button.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  bool isLoading = false;

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
          child: Visibility(
            visible: isLoading,
            child: const Center(
              child: Text('lagi loading'),
            ),
            replacement: ListView(
              children: [
                ProfileCard(username: widget.username),
                const Divider(
                    thickness: 6.0, height: 6.0, color: Color(0xfff2f2f2)),
                const OrderConfirmationButton(
                  icon: FontAwesomeIcons.creditCard,
                  text: "Menunggu pembayaran",
                  status: StatusBtnIndicator.waitingPayment,
                ),
                const OrderConfirmationButton(
                  icon: FontAwesomeIcons.solidCircleCheck,
                  text: "Menunggu verifikasi",
                  status: StatusBtnIndicator.waitingVerification,
                ),
                const OrderConfirmationButton(
                  icon: FontAwesomeIcons.ban,
                  text: "Pesanan dibatalkan",
                  status: StatusBtnIndicator.cancelled,
                ),
                const SuccessOrderList(),
              ],
            ),
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
  const ProfileCard({Key? key, required this.username}) : super(key: key);

  final String username;

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
            Text(username, style: titleSmall),
            const SizedBox(height: 4.0),
            const Text('Profile >', style: subNameText)
          ],
        ),
      ),
    );
  }
}

class SuccessOrderList extends StatelessWidget {
  const SuccessOrderList({Key? key}) : super(key: key);

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
