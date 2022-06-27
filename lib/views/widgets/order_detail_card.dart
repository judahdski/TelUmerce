import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/services/order/detail_order_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/text_theme.dart';
import '../../model/order.dart';
import '../../model/order_detail.dart';
import '../../services/order/all_order_services.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key, required this.orderId}) : super(key: key);

  final int orderId;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final oCcy = NumberFormat("#,##0", "en_US");
  final List _orders = [];
  final List _cartItems = [];
  Order? _order;
  OrderDetailModel? _orderDetail;

  bool isLoading = false;
  int idCart = 0;
  int jumlahHarga = 0;
  String alamat = 'Komplek Graha Santika Blok C1 No.15';
  int totalHargaBayar = 0;

  // -------------------- G E T  O R D E R S

  Future _getOrders() async {
    final response = await getAllOrderService();

    if (response.isSuccessful) {
      _orders.addAll(response.data as List<Order>);
    } else {
      print(
          'terjadi kesalahan saat mengambil data order \ncheckout_screen.dart 28:49');
    }
  }

  Future _getOrderDetail() async {
    final response = await getOrderDetail(widget.orderId);

    if (response.isSuccessful) {
      var orderDetail = response.data as OrderDetailModel;
      var cart = orderDetail.cart.cartItem;
      _cartItems.addAll(cart);
      _orderDetail = orderDetail;
    } else {
      var msg = response.errorMessage;
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

  int _getTotalHargaBayar() {
    return jumlahHarga + 5500;
  }

  _setUIState() {
    idCart = _orderDetail!.idCart;
    jumlahHarga = int.parse(_orderDetail!.jumlahHarga);
    alamat = _orderDetail!.alamat;
    totalHargaBayar = _getTotalHargaBayar();
  }

  Future _loadOrderDetailCard() async {
    setState(() => isLoading = true);

    await _getOrderDetail();
    await _getOrder();
    _setUIState();

    await Future.delayed(const Duration(milliseconds: 2));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadOrderDetailCard();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Visibility(
        visible: isLoading,
        child: Container(
          height: 200,
          color: const Color(0xffe5e5e5),
        ),
        replacement: ResponsiveLayout(
            smallMobile: Column(
              children: [
                //  Detail pesanan
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Detail Pesanan', style: titleSmall),
                      const SizedBox(height: 14.0),
                      Column(
                        children: [
                          //  Nama barang + harganya
                          Column(
                            children: _cartItems.map((cartItem) {
                              var product = cartItem.produk;
                              var totalHarga = cartItem.jumlahBarang * product.harga;

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //  Nama barang
                                  Text(product.productName, style: titleSmall),
                                  //Harga barang
                                  Text('Rp${oCcy.format(totalHarga)}', style: labelMedium),
                                ],
                              );
                            }).toList(),
                          ),

                          // DIVIDER
                          const Divider(height: 24.0),
                          //  END DIVIDER

                          //  Total harga barang
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  label
                              const Text('Harga produk', style: bodySmall),
                              //  Total harga
                              Text('Rp${oCcy.format(jumlahHarga)}',
                                  style: labelMedium),
                            ],
                          ),

                          const SizedBox(height: 6.0),

                          //  Ongkos kirim
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              //  label
                              Text('Ongkos kirim', style: bodySmall),
                              //  Ongkos kirim
                              Text('Rp5.500', style: labelMedium),
                            ],
                          ),

                          // DIVIDER
                          const Divider(height: 24.0),
                          //  END DIVIDER

                          //  total bayar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              //label
                              Text('Total harga', style: labelMedium),
                              // total keseluruhan harga
                              Text('Rp${oCcy.format(totalHargaBayar)}', style: totalBayar)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                    color: Color(0xfff2f2f2), thickness: 6.0, height: 6.0),
                //  Detail pengiriman
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Detail Pengiriman', style: titleSmall),
                      const SizedBox(height: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //  label
                          const Text('Alamat penerima', style: labelSmall),
                          const SizedBox(height: 8.0),
                          //  alamat user
                          Text(alamat, style: alamatUser),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            mediumMobile: Column(
              children: [
                //  Detail pesanan
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Detail Pesanan', style: titleMedium),
                      const SizedBox(height: 16.0),
                      Column(
                        children: [
                          //  Nama barang + harganya
                          //  bisa pake column klo barangnya lebih dari 1
                          Column(
                            children: _cartItems.map((cartItem) {
                              var product = cartItem.produk;
                              var totalHarga =
                                  cartItem.jumlahBarang * product.harga;

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //  Nama barang
                                  Text(product.productName, style: titleSmall),
                                  //Harga barang
                                  Text('Rp${oCcy.format(totalHarga)}', style: labelMedium),
                                ],
                              );
                            }).toList(),
                          ),

                          // DIVIDER
                          const Divider(height: 28.0),
                          //  END DIVIDER

                          //  Total harga barang
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  label
                              const Text('Harga produk', style: bodyMedium),
                              //  Total harga
                              Text('Rp${oCcy.format(jumlahHarga)}',
                                  style: labelLarge),
                            ],
                          ),

                          const SizedBox(height: 8.0),

                          //  Ongkos kirim
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              //  label
                              Text('Ongkos kirim', style: bodyMedium),
                              //  Ongkos kirim
                              Text('Rp5.500', style: labelLarge),
                            ],
                          ),

                          // DIVIDER
                          const Divider(height: 28.0),
                          //  END DIVIDER

                          //  total bayar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //label
                              Text('Total harga', style: labelLarge),
                              // total keseluruhan harga
                              Text('Rp${oCcy.format(totalHargaBayar)}', style: totalBayar)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                    color: Color(0xfff2f2f2), thickness: 7.0, height: 8.0),
                //  Detail pengiriman
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Detail Pengiriman', style: titleMedium),
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //  label
                          const Text('Alamat penerima', style: labelMedium),
                          const SizedBox(height: 10.0),
                          //  alamat user
                          Text(alamat, style: alamatUser),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
