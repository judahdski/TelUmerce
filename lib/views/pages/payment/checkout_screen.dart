import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/services/order/all_order_services.dart';
import 'package:telumerce/services/order/cancel_order_services.dart';
import 'package:telumerce/services/utils/helper_method.dart';
import 'package:telumerce/views/pages/fragment/main_window.dart';

import '../../../model/order.dart';
import '../../../services/order/timeout_order_services.dart';
import '../../responsive/responsive_layout.dart';
import '../../widgets/bank_info_card.dart';
import '../../widgets/order_detail_card.dart';
import 'payment_validation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key, required this.orderId}) : super(key: key);

  final int orderId;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isLoading = false;

  final List<Order> _orders = [];
  Order? _order;

  // -------------------- T I M E R  S T A T E
  int maxTime = 59;
  int minutes = 0;
  int seconds = 0;
  Timer? timer;

  _setUITimer() {
    minutes = maxTime;
    seconds = maxTime;
  }

  _startTime() {
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

  // -------------------- G E T  O R D E R S

  Future _getOrders() async {
    final response = await getAllOrderService();

    if (response.isSuccessful) {
      _orders.addAll(response.data as List<Order>);
    } else {
      createErrorSnackbar(context, response);
    }
  }

  Future _getOrder() async {
    await _getOrders();
    for (var order in _orders) {
      if (order.id == widget.orderId) {
        _order = order;
      }
    }
  }

  // --------------------------- C A N C E L  O R D E R

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

    await _getOrder();
    await _setUITimer();
    await _startTime();

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

  // ------------------------------------------------- U I  C O D E ----------------------------------------------------
  // ------------------------------------------------- U I  C O D E ----------------------------------------------------
  // ------------------------------------------------- U I  C O D E ----------------------------------------------------
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
          OrderDetail(orderId: widget.orderId),
          const Divider(color: Color(0xfff2f2f2), thickness: 6.0, height: 6.0),
          timeCounter(),
          const BankInfoCard(),
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

  Widget timeCounter() {
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
                const Text('Senin, 27 Juni 2022 21:44', style: labelMedium),
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
                const Text('Senin, 27 Juni 2022 21:44', style: labelLarge),
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

  Widget bankInfoCard() {
    return ResponsiveLayout(
        smallMobile: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 14.0),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text('Nomor rekening', style: bodySmall),
                  SizedBox(height: 6.0),
                  PasteButton(),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Total pembayaran', style: bodySmall),
                      SizedBox(height: 6.0),
                      Text(
                        'Rp69,220',
                        style: totalBayar,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/2560px-Bank_Mandiri_logo_2016.svg.png',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        mediumMobile: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text('Nomor rekening', style: bodySmall),
                  SizedBox(height: 6.0),
                  PasteButton(),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Total pembayaran', style: bodySmall),
                      SizedBox(height: 6.0),
                      Text(
                        'RpRp69,220',
                        style: totalBayar,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/2560px-Bank_Mandiri_logo_2016.svg.png',
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
