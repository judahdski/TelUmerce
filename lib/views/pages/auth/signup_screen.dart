import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/password_textfields.dart';
import 'package:telumerce/views/widgets/regular_textfields.dart';

import '../../../const/color_scheme.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          smallMobile: SignupSmall(),
          mediumMobile: SignupMedium(),
        ),
      ),
    );
  }
}

class SignupSmall extends StatefulWidget {
  const SignupSmall({Key? key}) : super(key: key);

  @override
  State<SignupSmall> createState() => _SignupSmallState();
}

class _SignupSmallState extends State<SignupSmall> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();

  double leftNRightScreenPadding = 18.0;
  bool isScrollable = false;

  void _changeToScrollView() {
    setState(() {
      isScrollable = true;
    });
  }

  void signup() {
    if (kDebugMode) {
      print(_namaController.text);
      print(_emailController.text);
      print(_passController.text);
      print(_passConfirmController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: isScrollable,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Buat akun', style: headlineSmall),
                const SizedBox(height: 24.0),
                RegularTextfields(
                    label: 'Nama',
                    hint: 'Masukan nama',
                    autoFocus: true,
                    controller: _namaController,
                    inputType: TextInputType.name),
                const SizedBox(height: 16.0),
                RegularTextfields(
                    label: 'E-mail',
                    hint: 'Masukan e-mail',
                    autoFocus: false,
                    controller: _emailController,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 16.0),
                PasswordTextfield(
                    label: 'Password', passController: _passController),
                const SizedBox(height: 16.0),
                PasswordTextfield(
                    label: 'Konfirmasi Password',
                    passController: _passConfirmController),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 16.0),
                  child: Row(
                    children: [
                      const Text('Sudah punya akun?', style: confirmationText),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text('Masuk',
                              style: confirmationButtonText))
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(darkBlue)),
                    onPressed: () {
                      signup();
                    },
                    child: const Text('Sign up'))
              ],
            ),
          ),
          replacement: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Buat akun', style: headlineSmall),
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
                      const Text('Sudah punya akun?', style: confirmationText),
                      TextButton(
                          onPressed: () {
                            //  Navigate to signup screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
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
      ),
    );
  }
}

class SignupMedium extends StatefulWidget {
  const SignupMedium({Key? key}) : super(key: key);

  @override
  State<SignupMedium> createState() => _SignupMediumState();
}

class _SignupMediumState extends State<SignupMedium> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();

  bool isScrollable = false;

  void _changeToScrollView() {
    setState(() {
      isScrollable = true;
    });
  }

  void signup() {
    if (kDebugMode) {
      print(_namaController.text);
      print(_emailController.text);
      print(_passController.text);
      print(_passConfirmController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: isScrollable,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Buat akun', style: headlineSmall),
                const SizedBox(height: 28.0),
                RegularTextfields(
                    label: 'Nama',
                    hint: 'Masukan nama',
                    autoFocus: true,
                    controller: _namaController,
                    inputType: TextInputType.name),
                const SizedBox(height: 18.0),
                RegularTextfields(
                    label: 'E-mail',
                    hint: 'Masukan e-mail',
                    autoFocus: false,
                    controller: _emailController,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 18.0),
                PasswordTextfield(
                    label: 'Password', passController: _passController),
                const SizedBox(height: 18.0),
                PasswordTextfield(
                    label: 'Konfirmasi Password',
                    passController: _passConfirmController),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 16.0),
                  child: Row(
                    children: [
                      const Text('Sudah punya akun?', style: confirmationText),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text('Masuk',
                              style: confirmationButtonText))
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(darkBlue)),
                    onPressed: () {
                      signup();
                    },
                    child: const Text('Sign up'))
              ],
            ),
          ),
          replacement: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Buat akun', style: headlineMedium),
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
                      const Text('Sudah punya akun?', style: confirmationText),
                      TextButton(
                          onPressed: () {
                            //  Navigate to signup screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
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
      ),
    );
  }
}
