import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/services/authentication_services.dart';
import 'package:telumerce/views/widgets/regular_textfields.dart';

import '../../../const/color_scheme.dart';
import '../../widgets/password_textfields.dart';
import '../fragment/main_window.dart';
import 'signup_screen.dart';

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
  bool isRegistered = false;

  //function / logic
  void _changeToScrollView() {
    setState(() {
      isScrollable = true;
    });
  }

  void _loginUser() async {
    final response = await login(_emailController.text, _passController.text);

    if (response.errorMessage == null) {
      if (kDebugMode) {
        print('login berhasil');
      }
      isRegistered = true;
    } else {
      if (kDebugMode) {
        print('login gagal. ERROR:${response.errorMessage}');
      }
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
                  const Text('Login', style: headlineSmall),
                  const SizedBox(height: 24.0),
                  RegularTextfields(label: 'E-mail', hint: 'Masukan e-mail', autoFocus: true, controller: _emailController, inputType: TextInputType.emailAddress),
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
                        // _loginUser();

                        if (isRegistered) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainWindow(0)));
                        }
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
                  const Text('Login', style: headlineSmall),
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
