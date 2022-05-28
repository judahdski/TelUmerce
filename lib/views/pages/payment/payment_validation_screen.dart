import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../const/color_scheme.dart';
import '../../../const/text_theme.dart';

class PaymentValidationScreen extends StatefulWidget {
  const PaymentValidationScreen({Key? key}) : super(key: key);

  @override
  State<PaymentValidationScreen> createState() =>
      _PaymentValidationScreenState();
}

class _PaymentValidationScreenState extends State<PaymentValidationScreen> {
  bool isUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Text(''),
        title: const Text('Validasi Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Visibility(
          visible: isUploaded,
          child: const ImageUploadedContainer(),
          replacement: ImagePickerContainer(
            buttonImage: imagePickerButton(
                icon: FontAwesomeIcons.image, text: 'Pilih Gambar'),
            buttonCamera: imagePickerButton(
                icon: FontAwesomeIcons.camera, text: 'Ambil Gambar'),
          ),
        ),
      ),
    );
  }

  ElevatedButton imagePickerButton(
      {required IconData icon, required String text}
      ) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            isUploaded = true;
          });
          //  TODO: Take an image from the gallery
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 14.0),
            const SizedBox(width: 10.0),
            Text(text)
          ],
        ));
  }
}

class ImageUploadedContainer extends StatelessWidget {
  const ImageUploadedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer(
      {Key? key, required this.buttonImage, required this.buttonCamera})
      : super(key: key);

  final ElevatedButton buttonImage;
  final ElevatedButton buttonCamera;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 16.0),
          child: Text('Mohon untuk mengupload bukti transfer.',
              style: TextStyle(color: darkBlue, fontSize: 12.0)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 48.0),
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
            children: [
              const FaIcon(FontAwesomeIcons.image,
                  color: Color(0xff707070), size: 24.0),
              const SizedBox(height: 14.0),
              const Text('JPG, JPEG, PNG max. 5 mb', style: bodySmall),
              const SizedBox(height: 18.0),
              Column(
                children: [
                  // TODO: make a separated widget
                  buttonImage,
                  buttonCamera
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
