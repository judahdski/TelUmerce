import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../const/color_scheme.dart';
import '../../widgets/password_textfields.dart';
import '../fragment/main_window.dart';
import 'signup_screen.dart';

const TextStyle titleText =
    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: darkBlue);
const TextStyle confirmationText =
    TextStyle(fontSize: 14.0, color: Color(0xff707070));
const TextStyle confirmationButtonText =
    TextStyle(fontSize: 14.0, color: darkBlue);
const TextStyle hintStyle = TextStyle(fontSize: 12.0, color: Color(0xffaaaaaa));

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //style
  double leftNRightScreenPadding = 18.0;

  //variable
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isScrollable = false;

  //function / logic
  void _changeToScrollView() {
    setState(() {
      isScrollable = true;
    });
  }

  void _login() {
    if (kDebugMode) {
      print(_emailController.text);
      print(_passController.text);
    }
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
            visible: isScrollable,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  vertical: 18.0, horizontal: leftNRightScreenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Login', style: titleText),
                  const SizedBox(height: 24.0),
                  TextField(
                    controller: _emailController,
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintText: 'Masukan e-mail',
                        hintStyle: hintStyle,
                        contentPadding: EdgeInsets.only(left: 10.0)),
                  ),
                  const SizedBox(height: 16.0),
                  PasswordTextfield(passController: _passController),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          'Belum punya akun?',
                          style: confirmationText,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()));
                            },
                            child: const Text('Daftar',
                                style: confirmationButtonText))
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(darkBlue)),
                      onPressed: () {
                        _login();
                        //TODO: goto main window
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const MainWindow(0)));
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
            replacement: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Login', style: titleText),
                  const SizedBox(height: 24.0),
                  TextField(
                    onTap: _changeToScrollView,
                    decoration: const InputDecoration(
                        hintText: 'Masukan e-mail',
                        hintStyle: hintStyle,
                        contentPadding: EdgeInsets.only(left: 10.0)),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                      onTap: _changeToScrollView,
                      decoration: const InputDecoration(
                          hintText: 'Masukan password',
                          hintStyle: hintStyle,
                          contentPadding: EdgeInsets.only(left: 10.0))),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          'Belum punya akun?',
                          style: confirmationText,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()));
                            },
                            child: const Text('Daftar',
                                style: confirmationButtonText))
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(darkBlue)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainWindow(0)));
                      },
                      child: const Text('Login'))
                ],
              ),
            )),
      ),
    );
  }
}
