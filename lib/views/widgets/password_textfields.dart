import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/color_scheme.dart';
import '../../const/text_theme.dart';
import '../utils/update_password.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield(
      {Key? key, required this.passController, required this.label})
      : super(key: key);

  final TextEditingController passController;
  final String label;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool isRevealed = true;

  void setRevealPassword() {
    //for change the suffix icon
    setState(() {
      isRevealed = !isRevealed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallMobile: TextField(
        controller: widget.passController,
        obscureText: isRevealed,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: const TextStyle(fontSize: 13.0),
          floatingLabelStyle: const TextStyle(fontSize: 16.0, color: darkBlue),
          hintText: 'Masukan password',
          hintStyle: hintStyleSmall,
          contentPadding: const EdgeInsets.only(left: 10.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: darkBlue),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffcdcdcd)),
              borderRadius: BorderRadius.circular(6.0)),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 48.0, minHeight: 24.0),
          suffixIconColor: Colors.blueAccent,
          suffixIcon: InkWell(
            onTap: setRevealPassword,
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
          ),
        ),
      ),
      mediumMobile: TextField(
        controller: widget.passController,
        obscureText: isRevealed,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: const TextStyle(fontSize: 14.0),
          floatingLabelStyle: const TextStyle(fontSize: 18.0, color: darkBlue),
          hintText: 'Masukan password',
          hintStyle: hintStyleMedium,
          contentPadding: const EdgeInsets.only(left: 12.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: darkBlue),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffcdcdcd)),
              borderRadius: BorderRadius.circular(8.0)),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 48.0, minHeight: 26.0),
          suffixIconColor: Colors.blueAccent,
          suffixIcon: InkWell(
            onTap: setRevealPassword,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: isRevealed,
                  child: const FaIcon(FontAwesomeIcons.eyeSlash, size: 17.0),
                  replacement: const FaIcon(FontAwesomeIcons.eye, size: 17.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class UpdatePasswordTextfield extends StatefulWidget {
  const UpdatePasswordTextfield(
      {Key? key, required this.passController, required this.label})
      : super(key: key);

  final TextEditingController passController;
  final String label;

  @override
  State<UpdatePasswordTextfield> createState() =>
      _UpdatePasswordTextfieldState();
}

class _UpdatePasswordTextfieldState extends State<UpdatePasswordTextfield> {
  bool isRevealed = true;

  void setRevealPassword() {
    setState(() {
      isRevealed = !isRevealed;
    });
  }

  navigateToUpdatePassScreen() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const UpdatePasswordScreen()), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallMobile: TextField(
        controller: widget.passController,
        obscureText: isRevealed,
        enableSuggestions: false,
        autocorrect: false,
        onTap: () {
          navigateToUpdatePassScreen();
        },
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: const TextStyle(fontSize: 13.0),
          floatingLabelStyle: const TextStyle(fontSize: 16.0, color: darkBlue),
          hintText: 'Masukan password',
          hintStyle: hintStyleSmall,
          contentPadding: const EdgeInsets.only(left: 10.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: darkBlue),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffcdcdcd)),
              borderRadius: BorderRadius.circular(6.0)),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 48.0, minHeight: 24.0),
          suffixIconColor: Colors.blueAccent,
          suffixIcon: InkWell(
            onTap: setRevealPassword,
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
          ),
        ),
      ),
      mediumMobile: TextField(
        controller: widget.passController,
        obscureText: isRevealed,
        enableSuggestions: false,
        autocorrect: false,
        onTap: () {
          navigateToUpdatePassScreen();
        },
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: const TextStyle(fontSize: 14.0),
          floatingLabelStyle: const TextStyle(fontSize: 18.0, color: darkBlue),
          hintText: 'Masukan password',
          hintStyle: hintStyleMedium,
          contentPadding: const EdgeInsets.only(left: 12.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: darkBlue),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffcdcdcd)),
              borderRadius: BorderRadius.circular(8.0)),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 48.0, minHeight: 26.0),
          suffixIconColor: Colors.blueAccent,
          suffixIcon: InkWell(
            onTap: setRevealPassword,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: isRevealed,
                  child: const FaIcon(FontAwesomeIcons.eyeSlash, size: 17.0),
                  replacement: const FaIcon(FontAwesomeIcons.eye, size: 17.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
