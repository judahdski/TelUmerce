import 'package:flutter/material.dart';

import '../../const/color_scheme.dart';

class UserInput extends StatelessWidget {
  const UserInput({Key? key, required this.label, required this.hint})
      : super(key: key);

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(fontSize: 13.0),
          floatingLabelStyle: const TextStyle(fontSize: 16.0, color: darkBlue),
          hintStyle: const TextStyle(fontSize: 12.0),
          hintText: hint,
          contentPadding: const EdgeInsets.all(12.0),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: darkBlueShade300, width: 1.5),
              borderRadius: BorderRadius.circular(6.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffcdcdcd)),
              borderRadius: BorderRadius.circular(6.0)),
        ),
      ),
    );
  }
}