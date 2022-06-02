import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/pages/auth/signup_screen.dart';

import '../../../const/color_scheme.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

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
                  const Text('Selamat datang!', style: headlineSmall),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Kami menyediakan barang yang anda perlukan.',
                    style: bodyMedium,
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
