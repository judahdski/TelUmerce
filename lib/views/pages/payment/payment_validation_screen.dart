import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/color_scheme.dart';
import '../../../const/text_theme.dart';
import '../../../services/order/payment_order_services.dart';
import '../fragment/main_window.dart';

class PaymentValidationScreen extends StatefulWidget {
  const PaymentValidationScreen({Key? key, required this.orderId})
      : super(key: key);

  final int orderId;

  @override
  State<PaymentValidationScreen> createState() =>
      _PaymentValidationScreenState();
}

class _PaymentValidationScreenState extends State<PaymentValidationScreen> {
  File? image;
  String imageName = '';
  bool isUploaded = false;

  void _retakeImage() {
    setState(() => isUploaded = false);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Validasi Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Visibility(
          visible: isUploaded,
          child: ImageUploadedContainer(
            imageName: imageName,
            orderId: widget.orderId,
            image: image,
            retakeBtnFunction: _retakeImage,
          ),
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
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        setState(() => isUploaded = false);
        Navigator.of(context).pop();
        return;
      }

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      setState(() => imageName = image.path);
    } on PlatformException catch (e) {
      String msg = 'Failed to pick image: $e';
      var snackbar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    Navigator.of(context).pop();
  }

  Future takeFromCamera() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        setState(() => isUploaded = false);
        Navigator.of(context).pop();
        return;
      }

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      setState(() => imageName = image.path);
    } on PlatformException catch (e) {
      String msg = 'Failed to pick image: $e';
      var snackbar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
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

class ImageUploadedContainer extends StatefulWidget {
  const ImageUploadedContainer(
      {Key? key,
      required this.image,
      required this.retakeBtnFunction,
      required this.orderId,
      required this.imageName})
      : super(key: key);

  final int orderId;
  final File? image;
  final String imageName;
  final VoidCallback retakeBtnFunction;

  @override
  State<ImageUploadedContainer> createState() => _ImageUploadedContainerState();
}

class _ImageUploadedContainerState extends State<ImageUploadedContainer> {
  bool isLoading = false;

  Future _uploadTransferForm() async {
    String msg = '';
    var orderId = widget.orderId;
    var imageFile = widget.imageName;

    setState(() => isLoading = true);
    print(orderId);
    print(imageFile);
    final response = await uploadPaymentOrderService(orderId, imageFile);
    setState(() => isLoading = false);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainWindow(0)),
        (Route<dynamic> route) => false);

    var snackbar = const SnackBar(content: Text('Terimakasih. Pembayaran anda sudah tersimpan.'));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    if (response.isSuccessful) {
      msg = 'Berhasil mengupload gambar';
    } else {
      msg = 'Gagal, karena ${response.errorMessage}';
    }
    print(msg);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.image == null)) {
      return const SizedBox();
    } else {
      return Visibility(
        visible: isLoading,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        replacement: Column(
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
                        border:
                            Border.all(color: darkBlueShade300, width: 8.0)),
                    child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Image.file(widget.image!,
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
                    widget.retakeBtnFunction();
                  },
                  child: const Text('Ambil ulang gambar', style: labelLarge),
                ),
                ElevatedButton(
                  onPressed: () {
                    _uploadTransferForm();
                  },
                  child: const Text('Selesai'),
                ),
              ],
            )
          ],
        ),
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
