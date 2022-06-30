import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/text_theme.dart';

class PriceCountWidget extends StatefulWidget {
  const PriceCountWidget({
    Key? key,
    required this.amount,
    required this.basePrice,
  }) : super(key: key);

  final int amount;
  final int basePrice;

  @override
  State<PriceCountWidget> createState() => _PriceCountWidgetState();
}

class _PriceCountWidgetState extends State<PriceCountWidget> {
  //state
  final oCcy = NumberFormat("#,##0", "en_US");

  int amount = 0;
  int basePrice = 0;
  int currentPrice = 0;

  //function
  _increaseAmount() {
    setState(() {
      if (amount >= 10) {
        Fluttertoast.showToast(
          msg: 'Anda mencapai jumlah maksimal pemesanan',
          toastLength: Toast.LENGTH_SHORT,
        );
        return;
      }

      amount++;
      currentPrice *= amount;
    });
  }

  _decreaseAmount() {
    if (amount <= 1) return;

    setState(() {
      amount--;
      currentPrice *= amount;
    });
  }

  @override
  void initState() {
    super.initState();

    amount = widget.amount;
    basePrice = widget.basePrice.toInt();
    currentPrice = basePrice;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ResponsiveLayout(
          smallMobile: SizedBox(
            width: 90,
            child: Text(
              'Rp ${oCcy.format(currentPrice)}',
              style: labelLarge,
            ),
          ),
          mediumMobile: SizedBox(
            width: 140,
            child: Text(
              'Rp ${oCcy.format(currentPrice)}',
              style: titleMedium,
            ),
          ),
        ),
        Container(
          width: 100.0,
          height: 38.0,
          decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    _decreaseAmount();
                  },
                  child: const Text(
                    '-',
                    textAlign: TextAlign.center,
                    style: minusText,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  amount.toString(),
                  textAlign: TextAlign.center,
                  style: titleSmall,
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    _increaseAmount();
                  },
                  child: const Text(
                    '+',
                    textAlign: TextAlign.center,
                    style: plusText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
