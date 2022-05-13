import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/pages/main_window.dart';

import 'wa_confirmation.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  //style
  final TextStyle _screenTitleText =
      const TextStyle(color: darkBlue, fontSize: 14.0);
  final TextStyle _productNameText =
      const TextStyle(color: darkBlue, fontWeight: FontWeight.w600);
  final TextStyle _productNameSubText =
      const TextStyle(fontSize: 10.0, color: Color(0xff5f5f5f));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            splashRadius: 24.0,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: 14.0,
              color: darkBlue,
            )),
        title: Text('Produk', style: _screenTitleText),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //  Navigate to the cart screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainWindow()));
              },
              splashRadius: 24.0,
              icon: const FaIcon(
                FontAwesomeIcons.basketShopping,
                size: 14.0,
                color: darkBlue,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Image.network(
                  'https://s4.bukalapak.com/img/4954929533/large/TUMBLER_STARBUCKS_RARE_LIMITED_EDITION_2.jpg',
                  fit: BoxFit.cover)),
          Container(
            height: 125.0,
            padding:
                const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(1, 2),
                        blurRadius: 6.0)
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tumbler', style: _productNameText),
                      Text('Stok tersedia', style: _productNameSubText),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const PriceCountWidget()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
  final TextStyle _productPriceText =
      const TextStyle(color: darkBlue, fontWeight: FontWeight.w800);

  final TextStyle _minusText =
      const TextStyle(color: Color(0xff707070), fontWeight: FontWeight.w600);

  final TextStyle _amountText =
      const TextStyle(color: darkBlue, fontWeight: FontWeight.w600);

  final TextStyle _plusText =
      const TextStyle(color: Color(0xff646464), fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 90, child: Text('Rp $price', style: _productPriceText)),
        Container(
          width: 80.0,
          height: 32.0,
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
                  style: _amountText,
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
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(darkBlue)),
            onPressed: () {
              //  Navigate to confirmation screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConfirmationScreen()));
            },
            child: const Text('Beli', style: TextStyle(fontSize: 12.0)))
      ],
    );
  }
}
