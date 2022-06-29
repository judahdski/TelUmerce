import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/services/utils/helper_method.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../model/order.dart';
import '../../services/order/all_order_services.dart';
import '../widgets/order_card.dart';

class WaitingPaymentVerificationScreen extends StatefulWidget {
  const WaitingPaymentVerificationScreen({Key? key}) : super(key: key);

  @override
  State<WaitingPaymentVerificationScreen> createState() => _WaitingPaymentVerificationScreenState();
}

class _WaitingPaymentVerificationScreenState extends State<WaitingPaymentVerificationScreen> {
  bool isLoading = false;
  final List<Order> _orders = [];
  final List<Order> _waitingPaymentVerificationOrders = [];

  Future _getOrders() async {
    final response = await getAllOrderService();

    if (response.isSuccessful) {
      _orders.addAll(response.data as List<Order>);
    } else {
      createErrorSnackbar(context, response);
    }
  }

  Future _getWaitingPaymentVerificationOrders() async {
    for (var order in _orders) {
      if (order.statusOrder.status == "Menunggu Verifikasi") {
        _waitingPaymentVerificationOrders.add(order);
      }
    }
  }

  Future _loadWaitingPaymentVerificationFragment() async {
    setState(() => isLoading = true);
    await _getOrders();
    await _getWaitingPaymentVerificationOrders();
    await Future.delayed(const Duration(milliseconds: 3));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadWaitingPaymentVerificationFragment();
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
        title: const Text('Menunggu verifikasi'),
      ),
      body: Visibility(
        visible: isLoading,
        child: const Center(child: CircularProgressIndicator(),),
        replacement: ResponsiveLayout(
          smallMobile: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 14.0),
            itemCount: _waitingPaymentVerificationOrders.length,
            itemBuilder: (_, int index) {
              var order = _waitingPaymentVerificationOrders[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: OrderCard(orderId: order.id),
              );
            },
          ),
          mediumMobile: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
            itemCount: _waitingPaymentVerificationOrders.length,
            itemBuilder: (_, int index) {
              var order = _waitingPaymentVerificationOrders[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: OrderCard(orderId: order.id),
              );
            },
          ),
        ),
      ),
    );
  }
}
