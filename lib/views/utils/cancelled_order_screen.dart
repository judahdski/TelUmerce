import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../model/order.dart';
import '../../services/order/all_order_services.dart';
import '../widgets/order_card.dart';

class CancelledOrderScreen extends StatefulWidget {
  const CancelledOrderScreen({Key? key}) : super(key: key);

  @override
  State<CancelledOrderScreen> createState() => _CancelledOrderScreenState();
}

class _CancelledOrderScreenState extends State<CancelledOrderScreen> {
  bool isLoading = false;
  final List<Order> _orders = [];
  final List<Order> _cancelledOrders = [];

  Future _getOrders() async {
    final response = await getAllOrderService();

    if (response.isSuccessful) {
      _orders.addAll(response.data as List<Order>);
    } else {
      print(
          'terjadi kesalahan saat mengambil data order \ncheckout_screen.dart 28:49');
    }
  }

  Future _getCancelledOrders() async {
    for (var order in _orders) {
      if (order.statusOrder.status == "Dibatalkan") {
        print(order);
      }
    }
  }

  Future _loadCancelledFragment() async {
    setState(() => isLoading = true);
    await _getOrders();
    await _getCancelledOrders();
    await Future.delayed(const Duration(milliseconds: 3));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadCancelledFragment();
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
        title: const Text('Pesanan dibatalkan'),
      ),
      body: Visibility(
        visible: isLoading,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        replacement: ResponsiveLayout(
          smallMobile: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 14.0),
            itemCount: 10,
            itemBuilder: (_, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: OrderCard(),
              );
            },
          ),
          mediumMobile: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
            itemCount: 8,
            itemBuilder: (_, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: OrderCard(),
              );
            },
          ),
        ),
      ),
    );
  }
}
