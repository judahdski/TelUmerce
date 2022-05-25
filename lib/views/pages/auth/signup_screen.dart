import 'package:flutter/material.dart';

import '../../../const/color_scheme.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  double leftNRightScreenPadding = 18.0;
  bool isScrollable = false;

  void _changeToScrollView() {
    setState(() {
      isScrollable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isScrollable
            ? SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: leftNRightScreenPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Buat akun', style: titleText),
                    const SizedBox(height: 24.0),
                    const TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                            hintText: 'Masukan nama',
                            hintStyle: hintStyle,
                            contentPadding: EdgeInsets.only(left: 10.0))),
                    const SizedBox(height: 16.0),
                    const TextField(
                        decoration: InputDecoration(
                            hintText: 'Masukan e-mail',
                            hintStyle: hintStyle,
                            contentPadding: EdgeInsets.only(left: 10.0))),
                    const SizedBox(height: 16.0),
                    const TextField(
                        decoration: InputDecoration(
                            hintText: 'Masukan password',
                            hintStyle: hintStyle,
                            contentPadding: EdgeInsets.only(left: 10.0))),
                    const SizedBox(height: 16.0),
                    const TextField(
                        decoration: InputDecoration(
                            hintText: 'Masukan password',
                            hintStyle: hintStyle,
                            contentPadding: EdgeInsets.only(left: 10.0))),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, bottom: 16.0),
                      child: Row(
                        children: [
                          const Text('Sudah punya akun?',
                              style: confirmationText),
                          TextButton(
                              onPressed: () {
                                //  Navigate to signup screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text('Masuk',
                                  style: confirmationButtonText))
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(darkBlue)),
                        onPressed: () {},
                        child: const Text('Sign up'))
                  ],
                ),
              )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal:  18.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Buat akun', style: titleText),
                    const SizedBox(height: 24.0),
                    TextField(
                      onTap: _changeToScrollView,
                        decoration: const InputDecoration(
                            hintText: 'Masukan nama',
                            hintStyle: hintStyle,
                            contentPadding: EdgeInsets.only(left: 10.0))),
                    const SizedBox(height: 16.0),
                    TextField(
                        onTap: _changeToScrollView,
                        decoration: const InputDecoration(
                            hintText: 'Masukan e-mail',
                            hintStyle: hintStyle,
                            contentPadding: EdgeInsets.only(left: 10.0))),
                    const SizedBox(height: 16.0),
                    TextField(
                        onTap: _changeToScrollView,
                        decoration: const InputDecoration(
                            hintText: 'Masukan password',
                            hintStyle: hintStyle,
                            contentPadding: EdgeInsets.only(left: 10.0))),
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
                          const Text('Sudah punya akun?',
                              style: confirmationText),
                          TextButton(
                              onPressed: () {
                                //  Navigate to signup screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text('Masuk',
                                  style: confirmationButtonText))
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(darkBlue)),
                        onPressed: () {},
                        child: const Text('Sign up'))
                  ],
                ),
            ),
      ),
    );
  }
}
