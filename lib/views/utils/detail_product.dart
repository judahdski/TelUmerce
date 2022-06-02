import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/text_theme.dart';

import '../../const/color_scheme.dart';
import '../pages/fragment/main_window.dart';
import '../widgets/price_counter.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  //style


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
        title: const Text('Produk'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //  Navigate to the cart screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainWindow(1)));
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
            height: 180.0,
            padding:
                const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 24.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Tumbler', style: titleSmall),
                      Text('Stok tersedia', style: productNameSubText),
                    ],
                  ),
                  const PriceCountWidget(),
                  ElevatedButton(
                      onPressed: () {
                        //  TODO: Add to the cart list
                      },
                      child: const Text('Tambah'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
