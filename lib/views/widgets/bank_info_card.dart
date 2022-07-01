import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/const/color_scheme.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/text_theme.dart';
import '../../model/order_detail.dart';
import '../../services/order/detail_order_services.dart';
import '../../services/utils/helper_method.dart';

class BankInfoCard extends StatefulWidget {
  const BankInfoCard({Key? key, required this.orderId, required this.deliveryMethod}) : super(key: key);

  final int orderId;
  final int deliveryMethod;

  @override
  State<BankInfoCard> createState() => _BankInfoCardState();
}

class _BankInfoCardState extends State<BankInfoCard> {
  bool isLoading = false;

  OrderDetailModel? _orderDetail;
  var oCcy = NumberFormat("#,##0", "en_US");

  int jumlahHarga = 0;
  int totalHargaBayar = 0;

  Future _getOrderDetail() async {
    final response = await getOrderDetail(widget.orderId);

    if (response.isSuccessful) {
      var orderDetail = response.data as OrderDetailModel;
      _orderDetail = orderDetail;
    } else {
      createErrorSnackbar(context, response);
    }
  }

  int _getTotalHargaBayar() {
    int ongkir = (widget.deliveryMethod == 2) ? 5000 : 0;

    return jumlahHarga + ongkir;
  }

  void _setUIState() {
    jumlahHarga = int.parse(_orderDetail!.jumlahHarga);
    totalHargaBayar = _getTotalHargaBayar();
  }

  Future _loadBankInfoCard() async {
    setState(() => isLoading = true);

    await _getOrderDetail();
    _setUIState();

    await Future.delayed(const Duration(milliseconds: 1));
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    _loadBankInfoCard();
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
                    children: [
                      const Text('Total pembayaran', style: bodySmall),
                      const SizedBox(height: 6.0),
                      Text(
                        'Rp${oCcy.format(totalHargaBayar)}',
                        style: totalBayarBankInfo,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                    child: CachedNetworkImage(
                      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/BANK_BRI_logo.svg/2560px-BANK_BRI_logo.svg.png',
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
                    children:  [
                      const Text('Total pembayaran', style: bodySmall),
                      const SizedBox(height: 6.0),
                      Text(
                        'Rp${oCcy.format(totalHargaBayar)}',
                        style: totalBayarBankInfo,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                    child: CachedNetworkImage(
                      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/BANK_BRI_logo.svg/2560px-BANK_BRI_logo.svg.png',
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class PasteButton extends StatelessWidget {
  const PasteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  TODO : copy to the clipboard
        FlutterClipboard.copy('8870881822773828');

        const snackBar = SnackBar(
          content: Text('Berhasil disalin!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: ResponsiveLayout(
        smallMobile: Container(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
          decoration: BoxDecoration(
              color: const Color(0xfff0f0f0),
              borderRadius: BorderRadius.circular(6.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '12321322',
                style: labelSmall,
              ),
              Row(
                children: const [
                  Text('Salin', style: labelSmall),
                  SizedBox(width: 6.0),
                  FaIcon(
                    FontAwesomeIcons.clone,
                    size: 10.0,
                    color: darkBlue,
                  )
                ],
              ),
            ],
          ),
        ),
        mediumMobile: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 16.0, 10.0),
          decoration: BoxDecoration(
              color: const Color(0xfff0f0f0),
              borderRadius: BorderRadius.circular(6.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '12321322',
                style: labelMedium,
              ),
              Row(
                children: const [
                  Text('Salin', style: labelMedium),
                  SizedBox(width: 8.0),
                  FaIcon(
                    FontAwesomeIcons.clone,
                    size: 12.0,
                    color: darkBlue,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
