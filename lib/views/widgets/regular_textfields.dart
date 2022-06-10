import 'package:flutter/material.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';

class RegularTextfields extends StatelessWidget {
  const RegularTextfields(
      {Key? key,
      required this.label,
      required this.hint,
      required this.autoFocus,
      required this.controller,
      required this.inputType})
      : super(key: key);

  final String label;
  final String hint;
  final bool autoFocus;
  final TextEditingController controller;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallMobile: TextField(
        controller: controller,
        autofocus: autoFocus,
        keyboardType: inputType,
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
      mediumMobile: TextField(
        controller: controller,
        autofocus: autoFocus,
        keyboardType: inputType,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(fontSize: 14.0),
          floatingLabelStyle: const TextStyle(fontSize: 18.0, color: darkBlue),
          hintStyle: const TextStyle(fontSize: 14.0),
          hintText: hint,
          contentPadding: const EdgeInsets.all(14.0),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: darkBlueShade300, width: 1.5),
              borderRadius: BorderRadius.circular(8.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffcdcdcd)),
              borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
