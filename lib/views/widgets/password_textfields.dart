import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/text_theme.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({Key? key, required this.passController})
      : super(key: key);

  final TextEditingController passController;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool isRevealed = true;

  void _setRevealPassword() {
    //for change the suffix icon
    setState(() {
      isRevealed = !isRevealed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.passController,
        obscureText: isRevealed,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: 'Masukan password',
            hintStyle: hintStyle,
            contentPadding: const EdgeInsets.only(left: 10.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(color: Colors.blueAccent),
            ),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 48.0, minHeight: 24.0),
            suffixIconColor: Colors.blueAccent,
            suffixIcon: InkWell(
              onTap: _setRevealPassword,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isRevealed,
                    child: const FaIcon(FontAwesomeIcons.eyeSlash, size: 16.0),
                    replacement: const FaIcon(FontAwesomeIcons.eye, size: 16.0),
                  ),
                ],
              ),
            )));
  }
}
