import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';

import '../../const/text_theme.dart';

class BankInfoCard extends StatelessWidget {
  const BankInfoCard({Key? key}) : super(key: key);

  //style
  final TextStyle totalBayar = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w600, color: Color(0xffe83232));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 14.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000), offset: Offset(1, 2), blurRadius: 6.0)
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
                  const Text(
                      'Total pembayaran',
                      style: bodySmall
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    'Rp29.500',
                    style: totalBayar,
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/2560px-Bank_Mandiri_logo_2016.svg.png',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PasteButton extends StatelessWidget {
  const PasteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      //  TODO : copy to the clipboard
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
        decoration: BoxDecoration(
            color: const Color(0xfff0f0f0),
            borderRadius: BorderRadius.circular(6.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '8870881822773828',
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
    );
  }
}
