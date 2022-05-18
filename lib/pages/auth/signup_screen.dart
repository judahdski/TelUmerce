import 'package:flutter/material.dart';
import 'package:telumerce/pages/auth/login_screen.dart';

import '../../const/color_scheme.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidthSize = MediaQuery.of(context).size.width;
    var leftNRightScreenPadding = 0.0;

    if (screenWidthSize < 360) {
      leftNRightScreenPadding = 18.0;
    } else if (screenWidthSize < 414) {
      leftNRightScreenPadding = 20.0;
    } else {
      leftNRightScreenPadding = 24.0;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: 18.0, horizontal: leftNRightScreenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Buat akun', style: titleText),
              const SizedBox(height: 24.0),
              const TextField(
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
                    const Text('Sudah punya akun?', style: confirmationText),
                    TextButton(
                        onPressed: () {
                          //  Navigate to signup screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child:
                            const Text('Masuk', style: confirmationButtonText))
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
