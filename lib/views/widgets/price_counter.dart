import 'package:flutter/material.dart';

import '../../const/text_theme.dart';

class PriceCountWidget extends StatefulWidget {
  const PriceCountWidget(
      {Key? key,
      required this.price,
      required this.amountOfProduct,
      required this.isCartCard})
      : super(key: key);

  final double price;
  final int amountOfProduct;
  final bool isCartCard;

  @override
  State<PriceCountWidget> createState() => _PriceCountWidgetState();
}

class _PriceCountWidgetState extends State<PriceCountWidget> {
  //state
  int amount = 0;
  double basePrice = 0;
  double price = 0;

  //function
  increaseAmount() {
    // TODO : Check if isCartCard is true or false
    // TODO : if true then update the amount of product and the price

    setState(() {
      amount++;
      price = basePrice * amount;
    });
  }

  decreaseAmount() {
    // TODO : Check if isCartCard is true or false
    // TODO : if true then update the amount of product and the price

    if (amount != 1) {
      setState(() {
        amount--;
        price = basePrice * amount;
      });
    }
    return;
  }

  @override
  void initState() {
    super.initState();

    amount = widget.amountOfProduct;
    basePrice = widget.price;
    price = widget.price;
  }

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
                    child: const Text(
                      '-',
                      textAlign: TextAlign.center,
                      style: minusText,
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
                    child: const Text(
                      '+',
                      textAlign: TextAlign.center,
                      style: plusText,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
