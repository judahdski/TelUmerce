import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/pages/auth/signup_screen.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../../const/color_scheme.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ResponsiveLayout(
          smallMobile: GetStartedSmall(),
          mediumMobile: GetStartedMedium(),
        ),
      ),
    );
  }
}

// ---------------------------- s m a l l   w i d g e t
class GetStartedSmall extends StatelessWidget {
  const GetStartedSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset('assets/logo.png', width: 125, height: 125),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 16.0, 14.0, 42.0),
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
                          backgroundColor: MaterialStateProperty.all(darkBlue)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: const Text('Mari mulai')),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class GetStartedMedium extends StatelessWidget {
  const GetStartedMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset('assets/logo.png', width: 150, height: 150),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 42.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Selamat datang!', style: headlineMedium),
              const SizedBox(height: 10.0),
              const Text(
                'Kami menyediakan barang yang anda perlukan.',
                style: bodyLarge,
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
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
                          backgroundColor: MaterialStateProperty.all(darkBlue)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: const Text('Mari mulai')),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
