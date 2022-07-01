import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/services/order/cancel_order_services.dart';
import 'package:telumerce/views/pages/fragment/main_window.dart';

import '../../../services/order/timeout_order_services.dart';
import '../../responsive/responsive_layout.dart';
import '../../widgets/bank_info_card.dart';
import '../../widgets/order_detail_card.dart';
import 'payment_validation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key, required this.orderId, required this.deliveryMethod}) : super(key: key);

  final int orderId;
  final int deliveryMethod;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isLoading = false;

  Future _cancelOrder() async {
    String msg = '';
    final response = await cancelOrderService(widget.orderId);

    if (response.isSuccessful) {
      msg = response.data as String;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainWindow(0)),
          (Route<dynamic> route) => false);
    } else {
      msg = 'Gagal, karena ${response.errorMessage}';
    }

    var snackbar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future _loadCheckoutScreen() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 3));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadCheckoutScreen();
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
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
        ),
        title: const Text('Checkout', style: titleMedium),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24.0),
        children: [
          OrderDetail(orderId: widget.orderId, deliveryMethod: widget.deliveryMethod),
          const Divider(color: Color(0xfff2f2f2), thickness: 6.0, height: 6.0),
          TimeCounter(orderId: widget.orderId),
           BankInfoCard(orderId: widget.orderId, deliveryMethod: widget.deliveryMethod),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentValidationScreen(
                              orderId: widget.orderId)));
                },
                child: const Text('Bayar')),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14.0),
            child: OutlinedButton(
              onPressed: () {
                _cancelOrder();
              },
              child: const Text(
                'Batal Pesan',
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TimeCounter extends StatefulWidget {
  const TimeCounter({Key? key, required this.orderId}) : super(key: key);

  final int orderId;

  @override
  State<TimeCounter> createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  int maxTime = 59;
  int minutes = 0;
  int seconds = 0;

  Timer? timer;

  void _setUITimer() {
    minutes = maxTime;
    seconds = maxTime;
  }

  void _startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        if (minutes > 0) {
          setState(() {
            minutes--;
            seconds = maxTime;
          });
        } else {
          timesUp();
        }
      }
    });
  }

  void timesUp() async {
    timer?.cancel();

    await _orderTimesUp(widget.orderId);
  }

  Future _orderTimesUp(int id) async {
    String msg = '';
    final response = await timeoutOrderService(id);

    if (response.isSuccessful) {
      msg = response.data as String;
    } else {
      msg = 'Gagal, karena ${response.errorMessage}';
    }

    var snackbar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future _loadTimeCounter() async {
    _setUITimer();
    _startTime();
  }

  @override
  void initState() {
    super.initState();

    _loadTimeCounter();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallMobile: Container(
        padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 10.0),
        margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(1, 2),
                  blurRadius: 6.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Batas Akhir Pembayaran', style: bodySmall),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jumat, 01 Juli 2022 14:36', style: labelMedium),
                Text(
                    '00 : ${(minutes < 10) ? '0$minutes' : minutes}:${(seconds < 10) ? '0$seconds' : seconds}',
                    style: timeLabel),
              ],
            )
          ],
        ),
      ),
      mediumMobile: Container(
        padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 12.0),
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(1, 2),
                  blurRadius: 6.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Batas Akhir Pembayaran', style: bodyMedium),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jumat, 01 Juli 2022 14:36', style: labelLarge),
                Text(
                    '00 : ${(minutes < 10) ? '0$minutes' : minutes} : ${(seconds < 10) ? '0$seconds' : seconds}',
                    style: timeLabel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
