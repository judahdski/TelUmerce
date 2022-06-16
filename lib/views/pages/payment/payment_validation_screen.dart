import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/color_scheme.dart';
import '../../../const/text_theme.dart';

class PaymentValidationScreen extends StatefulWidget {
  const PaymentValidationScreen({Key? key}) : super(key: key);

  @override
  State<PaymentValidationScreen> createState() =>
      _PaymentValidationScreenState();
}

class _PaymentValidationScreenState extends State<PaymentValidationScreen> {
  //Variable
  File? image;
  bool isUploaded = false;

  // UI
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
          child: ImageUploadedContainer(image: image),
          replacement: ImagePickerContainer(
            buttonImage: imagePickerButton(
                icon: FontAwesomeIcons.image,
                text: 'Pilih Gambar',
                isCamera: false),
            buttonCamera: imagePickerButton(
                icon: FontAwesomeIcons.camera,
                text: 'Ambil Gambar',
                isCamera: true),
          ),
        ),
      ),
    );
  }

  Future takeFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  Future takeFromCamera() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }

    Navigator.of(context).pop();
  }

  ElevatedButton imagePickerButton(
      {required IconData icon, required String text, required bool isCamera}) {
    return ElevatedButton(
        onPressed: () {
          (isCamera) ? takeFromCamera() : takeFromGallery();
          setState(() => isUploaded = true);
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
  const ImageUploadedContainer({Key? key, required this.image})
      : super(key: key);

  final File? image;

  @override
  Widget build(BuildContext context) {
    if ((image == null)) {
      return const SizedBox();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Container(
                  width: 220.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: darkBlueShade300, width: 8.0)),
                  child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Image.file(image!,
                          fit: BoxFit.cover, alignment: Alignment.center)),
                ),
              ),
              const Text(
                  'Bukti transfer akan diverifikasi terlebih dahulu oleh admin kami, pastikan bukti transfer sudah benar',
                  style: bodySmall,
                  textAlign: TextAlign.center),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PaymentValidationScreen()));
                },
                child: const Text('Ambil ulang gambar', style: labelLarge),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Selesai'),
              ),
            ],
          )
        ],
      );
    }
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
