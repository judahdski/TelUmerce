import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/regular_textfields.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  // variable
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
        ),
        title: const Text('Edit profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            alignment: Alignment.center,
            child: SizedBox(
              height: 80.0,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0, right: 0, bottom: 0, left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0x3d949494),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: const Center(
                          child: FaIcon(FontAwesomeIcons.pencil)),
                    ),
                  )
                ],
              ),
            ),
          ),
          RegularTextfields(
              label: 'Nama',
              hint: 'Masukan nama',
              autoFocus: true,
              controller: _namaController,
              inputType: TextInputType.name),
          RegularTextfields(
              label: 'E-mail',
              hint: 'Masukan e-mail',
              autoFocus: false,
              controller: _emailController,
              inputType: TextInputType.emailAddress),
          RegularTextfields(
              label: 'Nomor HP',
              hint: 'Masukan nomor hp',
              autoFocus: false,
              controller: _phoneNumController,
              inputType: TextInputType.number),
          RegularTextfields(
              label: 'Alamat',
              hint: 'Masukan alamat',
              autoFocus: false,
              controller: _addressController,
              inputType: TextInputType.streetAddress),
          ElevatedButton(onPressed: () {}, child: const Text('Simpan'))
        ],
      ),
    );
  }
}
