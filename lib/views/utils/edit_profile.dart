import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/user_input_textfields.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
            height: 120.0,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                'User profile picture',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const UserInput(label: 'Nama', hint: 'Masukan nama'),
          const UserInput(label: 'E-mail', hint: 'Masukan e-mail'),
          const UserInput(label: 'Nomor HP', hint: 'Masukan nomor handphone'),
          const UserInput(label: 'Alamat', hint: 'Masukan alamat'),
          ElevatedButton(onPressed: () {}, child: const Text('Simpan'))
        ],
      ),
    );
  }
}
