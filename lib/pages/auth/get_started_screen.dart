import 'package:flutter/material.dart';
import 'package:telumerce/pages/auth/login_screen.dart';
import 'package:telumerce/pages/auth/signup_screen.dart';

import '../../const/color_scheme.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  //style
  final TextStyle _titleScreenText = const TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.bold, color: darkBlue);
  final TextStyle _subTitleScreenText = const TextStyle(color: darkBlue);

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/logo.png', width: 125, height: 125),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  leftNRightScreenPadding, 16.0, leftNRightScreenPadding, 42.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Selamat datang!', style: _titleScreenText),
                  const SizedBox(height: 10.0),
                  Text(
                    'Kami menyediakan barang yang anda perlukan.',
                    style: _subTitleScreenText,
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            //  Navigate to login screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(color: darkBlue),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(darkBlue)),
                          onPressed: () {
                            //  Navigate to signup screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                          child: const Text('Mari mulai')),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}