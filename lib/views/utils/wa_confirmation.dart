import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/color_scheme.dart';


class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // Navigate back to prev screen
            Navigator.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          iconSize: 14.0,
          color: darkBlue,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Mohon maaf!\nUntuk sementara konfirmasi pesanan dan pembayaran dilakukan melalui whatsapp. Terimakasih🙏🏻',
                textAlign: TextAlign.center,
                style: TextStyle(color: darkBlue),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(darkBlue)),
                onPressed: () {},
                child: const Text('Pergi ke whatsapp')),
          ],
        ),
      ),
    );
  }
}
