import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../model/order.dart';
import '../../services/order/all_order_services.dart';
import '../widgets/order_card.dart';

class WaitingPaymentScreen extends StatefulWidget {
  const WaitingPaymentScreen({Key? key}) : super(key: key);

  @override
  State<WaitingPaymentScreen> createState() => _WaitingPaymentScreenState();
}

class _WaitingPaymentScreenState extends State<WaitingPaymentScreen> {
  bool isLoading = false;
  final List<Order> _orders = [];
  final List<Order> _waitingPaymentOrders = [];

  Future _getOrders() async {
    final response = await getAllOrderService();

    if (response.isSuccessful) {
      _orders.addAll(response.data as List<Order>);
    } else {
      print(
          'terjadi kesalahan saat mengambil data order \ncheckout_screen.dart 28:49');
    }
  }

  Future _getWaitingPaymentOrders() async {
    for (var order in _orders) {
      if (order.statusOrder.status == "Menunggu Pembayaran") {
        print(order);
      }
    }
  }

  Future _loadWaitingPaymentFragment() async {
    setState(() => isLoading = true);
    await _getOrders();
    await _getWaitingPaymentOrders();
    await Future.delayed(const Duration(milliseconds: 3));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadWaitingPaymentFragment();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 14.0),
        ),
        title: const Text('Menunggu pembayaran'),
      ),
      body: ResponsiveLayout(
          smallMobile: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 14.0),
            itemCount: 0,
            itemBuilder: (_, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: OrderCard(),
              );
            },
          ),
          mediumMobile: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
            itemCount: 0,
            itemBuilder: (_, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: OrderCard(),
              );
            },
          )),
    );
  }
}
