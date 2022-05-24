import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/const/color_scheme.dart';

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
        children: [
          Container(
            height: 120.0,
            color: Colors.blueAccent,
            child: const Center(child: Text('User profile picture', style: TextStyle(color: Colors.white),),),
          ),
          const UserInput(label: 'Nama', hint: 'Masukan nama'),
          const UserInput(label: 'E-mail', hint: 'Masukan e-mail'),
          const UserInput(label: 'Nomor HP', hint: 'Masukan nomor handphone'),
          const UserInput(label: 'Alamat', hint: 'Masukan alamat'),
        ],
      ),
    );
  }
}

class UserInput extends StatelessWidget {
  const UserInput({Key? key, required this.label, required this.hint}) : super(key: key);

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(fontSize: 14.0),
          floatingLabelStyle: const TextStyle(fontSize: 16.0, color: darkBlue),
          hintStyle: const TextStyle(fontSize: 14.0),
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: darkBlueShade300, width: 1.5),
              borderRadius: BorderRadius.circular(6.0)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffcdcdcd), width: 1.0),
            borderRadius: BorderRadius.circular(6.0)
          ),
        ),
      ),
    );
  }
}

