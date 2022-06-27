import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/const/color_scheme.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../model/order.dart';
import '../../services/order/all_order_services.dart';
import '../utils/detail_order_screen.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({Key? key}) : super(key: key);

  final int orderId = 39;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  final oCcy = NumberFormat("#,##0", "en_US");
  String statusText = '';
  String nomorResi = '';
  String jumlahHarga = '0';
  bool isLoading = false;

  final List<Order> _orders = [];
  Order? _order;

  Future _getOrders() async {
    final response = await getAllOrderService();

    if (response.isSuccessful) {
      _orders.addAll(response.data as List<Order>);
    } else {
      print(
          'terjadi kesalahan saat mengambil data order \ncheckout_screen.dart 28:49');
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

  _setUIState() {
    statusText = _order!.statusOrder.status;
    nomorResi = _order!.noResi;
    jumlahHarga = _order!.jumlahHarga;
  }

  Future _loadOrderCard() async {
    setState(() => isLoading = true);

    await _getOrder();
    print(_order.toString());
    _setUIState();

    await Future.delayed(const Duration(milliseconds: 3));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadOrderCard();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: if (order.status != succeed) return;
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const DetailOrderScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffcdcdcd)),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ResponsiveLayout(
          smallMobile: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.bagShopping,
                        size: 12.0,
                        color: darkBlue,
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Pesanan', style: bodySmall),
                          SizedBox(height: 4.0),
                          Text('27 Juni 2022', style: orderIdSmall),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OrderStatus(statusText: statusText,),
                      const SizedBox(height: 4.0),
                      Text(nomorResi, style: orderIdSmall),
                    ],
                  )
                ],
              ),
              const Divider(
                color: Color(0xffCDCDCD),
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('', style: linkTextSmall),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      const Text('Total belanja', style: bodySmall),
                      const SizedBox(height: 4.0),
                      Text('Rp${oCcy.format(jumlahHarga)}', style: labelLarge),
                    ],
                  )
                ],
              ),
            ],
          ),
          mediumMobile: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.bagShopping,
                        size: 14.0,
                        color: darkBlue,
                      ),
                      const SizedBox(width: 14.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Pesanan', style: bodyMedium),
                          SizedBox(height: 5.0),
                          Text('27 Juni 2022', style: orderIdMedium),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OrderStatus(statusText: statusText,),
                      const SizedBox(height: 6.0),
                      Text(nomorResi, style: orderIdMedium),
                    ],
                  )
                ],
              ),
              const Divider(
                color: Color(0xffCDCDCD),
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('', style: linkTextMedium),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      const Text('Total belanja', style: bodyMedium),
                      const SizedBox(height: 4.0),
                      Text('Rp${oCcy.format(jumlahHarga)}', style: labelLarge),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key, required this.statusText}) : super(key: key);

  final String statusText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: const Color(0xffFFA500),
      ),
      child: ResponsiveLayout(
          smallMobile: Text(statusText, style: statusTextSmall),
          mediumMobile: Text(statusText, style: statusTextMedium)),
    );
  }
}
