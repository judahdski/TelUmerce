import 'package:flutter/material.dart';

import '../../const/text_theme.dart';

class PriceCountWidget extends StatefulWidget {
  const PriceCountWidget({Key? key}) : super(key: key);

  @override
  State<PriceCountWidget> createState() => _PriceCountWidgetState();
}

class _PriceCountWidgetState extends State<PriceCountWidget> {
  //state
  int amount = 1;
  int basePrice = 25000;
  int price = 25000;

  //function
  increaseAmount() {
    setState(() {
      amount++;
      price = basePrice * amount;
    });
  }

  decreaseAmount() {
    if (amount != 1) {
      setState(() {
        amount--;
        price = basePrice * amount;
      });
    }
    return;
  }

  //style
  final TextStyle _minusText =
  const TextStyle(color: Color(0xff707070), fontWeight: FontWeight.w600);

  final TextStyle _plusText =
  const TextStyle(color: Color(0xff646464), fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 90, child: Text('Rp $price', style: labelLarge)),
        Container(
          width: 90.0,
          height: 30.0,
          decoration: BoxDecoration(
              color: const Color(0xfff5f5f5),
              borderRadius: BorderRadius.circular(6.0)),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {
                      //  Decrease amount
                      decreaseAmount();
                    },
                    child: Text(
                      '-',
                      textAlign: TextAlign.center,
                      style: _minusText,
                    )),
              ),
              // Amount of the product's
              Expanded(
                child: Text(
                  '$amount',
                  textAlign: TextAlign.center,
                  style: titleSmall,
                ),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      //  Increase amount
                      increaseAmount();
                    },
                    child: Text(
                      '+',
                      textAlign: TextAlign.center,
                      style: _plusText,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}