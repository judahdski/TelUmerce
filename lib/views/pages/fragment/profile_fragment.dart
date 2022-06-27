import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/widgets/order_card.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../../model/order.dart';
import '../../../model/user.dart';
import '../../../services/order/all_order_services.dart';
import '../../../services/user/get_user_services.dart';
import '../../utils/edit_profile.dart';
import '../../widgets/order_verification_button.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  bool isLoading = false;

  String username = '';
  User? user;

  final List<Order> _orders = [];
  final List<Order> _successfulOrders = [];

  Future _getUserInfo() async {
    final response = await getUserService();

    if (response.isSuccessful) {
      var user = response.data as User;
      setState(() {
        username = user.name;
        this.user = user;
      });
    }
  }

  Future _getOrders() async {
    final response = await getAllOrderService();

    if (response.isSuccessful) {
      _orders.addAll(response.data as List<Order>);
    } else {
      print(
          'terjadi kesalahan saat mengambil data order \ncheckout_screen.dart 28:49');
    }
  }

  Future _getSuccessfulOrders() async {
    for(var order in _orders) {
      if (order.statusOrder.status == "Selesai") {
        _successfulOrders.add(order);
      }
    }
  }

  Future _loadProfileFragment() async {
    setState(() => isLoading = true);
    await _getOrders();
    await _getSuccessfulOrders();
    await _getUserInfo();
    await Future.delayed(const Duration(milliseconds: 3));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadProfileFragment();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

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
              child: CircularProgressIndicator(),
            ),
            replacement: ListView(
              children: [
                ProfileCard(username: username),
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
                SuccessOrderList(orders: _successfulOrders,),
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
  const SuccessOrderList({Key? key, required this.orders}) : super(key: key);

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 14.0),
      child: Column(
        children: orders.map((order) {
          return OrderCard(orderId: order.id,);
        }).toList(),
      ),
    );
  }
}
