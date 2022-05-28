import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../const/color_scheme.dart';
import '../../../const/text_theme.dart';

class PaymentValidationScreen extends StatelessWidget {
  const PaymentValidationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Text(''),
        title: const Text('Validasi Pembayaran'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomContainer(),
      ),
    );
  }
}

class CustomContainer extends StatefulWidget {
  const CustomContainer({Key? key}) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (isUploaded) ? imageUploadedContainer() : imagePickerContainer(),
    );
  }

  // user masih harus upload bukti transfer
  Column imagePickerContainer() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 16.0),
          child: Text('Mohon untuk mengupload bukti transfer.',
              style: TextStyle(color: darkBlue, fontSize: 12.0)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 42.0, horizontal: 56.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 6.0)
              ]),
          child: Column(
            children: [
              const FaIcon(FontAwesomeIcons.image, color: Color(0xff707070)),
              const SizedBox(height: 12.0),
              const Text(
                'JPG, JPEG, PNG max. 5 mb',
                style: TextStyle(fontSize: 10.0, color: Color(0xff707070)),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isUploaded = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.image, size: 14.0),
                      SizedBox(width: 10.0),
                      Text('Pilih Gambar')
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isUploaded = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.camera, size: 14.0),
                      SizedBox(width: 10.0),
                      Text('Ambil Gambar')
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }

//  user sudah berhasil mengupload bukti transfer
  Stack imageUploadedContainer() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Container(
                  width: 220.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: darkBlueShade300, width: 8.0)),
                  child: Image.network(
                      'https://i.pinimg.com/736x/a5/0e/5e/a50e5e839949d2f19271d83c12bd0abc.jpg')),
            ),
            const Text(
                'Bukti transfer akan diverifikasi terlebih dahulu oleh admin kami, pastikan bukti transfer sudah benar',
                style: bodySmall,
                textAlign: TextAlign.center),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Selesai'),
            ),
          ),
        )
      ],
    );
  }
}
