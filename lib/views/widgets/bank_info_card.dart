import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/text_theme.dart';

class BankInfoCard extends StatelessWidget {
  const BankInfoCard({Key? key}) : super(key: key);

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
                    children: const [
                      Text('Total pembayaran', style: bodySmall),
                      SizedBox(height: 6.0),
                      Text(
                        'Rp69,220',
                        style: totalBayarBankInfo,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                    child: CachedNetworkImage(
                      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/2560px-Bank_Mandiri_logo_2016.svg.png',
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
                        'Rp69,220',
                        style: totalBayar,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                    child: CachedNetworkImage(
                      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/2560px-Bank_Mandiri_logo_2016.svg.png',
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
        mediumMobile: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 16.0, 10.0),
          decoration: BoxDecoration(
              color: const Color(0xfff0f0f0),
              borderRadius: BorderRadius.circular(6.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '8870881822773828',
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
