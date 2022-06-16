import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/services/auth/getuser_auth_services.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/regular_textfields.dart';

import '../../../const/color_scheme.dart';
import '../../../services/auth/login_auth_services.dart';
import '../../widgets/password_textfields.dart';
import '../fragment/main_window.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //variable
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isScrollable = false;
  bool isValid = false;
  String errorMessage = '';

  //function / logic
  void _changeToScrollView() {
    setState(() {
      isScrollable = true;
    });
  }

  void sanitationCheck() {
    if (_emailController.text == '') {
      errorMessage = 'Email tidak boleh kosong';
      isValid = false;
      return;
    }
    if (_passController.text == '') {
      errorMessage = 'Password tidak boleh kosong';
      isValid = false;
      return;
    }
    isValid = true;
  }

  Future<bool> _login() async {
    var isSuccess = false;

    if (!isValid) return isSuccess;

    final response = await login(_emailController.text, _passController.text);
    if (response.errorMessage == null) {
      isSuccess = true;
    } else {
      errorMessage = '${response.errorMessage}';
    }

    return isSuccess;
  }

  _setLoginButton() async {
    sanitationCheck();

    if (await _login()) {
      var response = await getUserService();

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MainWindow(0, response.user?.name)));
      var snackBar = const SnackBar(content: Text("Login berhasil"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(content: Text(errorMessage));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          smallMobile: Visibility(
              visible: isScrollable,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18.0),
                // main widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Login', style: headlineSmall),
                    const SizedBox(height: 24.0),
                    RegularTextfields(
                        label: 'E-mail',
                        hint: 'Masukan e-mail',
                        autoFocus: true,
                        controller: _emailController,
                        inputType: TextInputType.emailAddress),
                    const SizedBox(height: 16.0),
                    PasswordTextfield(
                        label: 'Password', passController: _passController),
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
                            backgroundColor:
                                MaterialStateProperty.all(darkBlue)),
                        onPressed: () {
                          _setLoginButton();
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
                          hintStyle: hintStyleSmall,
                          contentPadding: EdgeInsets.only(left: 10.0)),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                        onTap: _changeToScrollView,
                        decoration: const InputDecoration(
                            hintText: 'Masukan password',
                            hintStyle: hintStyleSmall,
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
                            backgroundColor:
                                MaterialStateProperty.all(darkBlue)),
                        onPressed: () {
                          _changeToScrollView();
                        },
                        child: const Text('Login'))
                  ],
                ),
              )),
          mediumMobile: Visibility(
            visible: isScrollable,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Login', style: headlineSmall),
                  const SizedBox(height: 30.0),
                  RegularTextfields(
                      label: 'E-mail',
                      hint: 'Masukan e-mail',
                      autoFocus: true,
                      controller: _emailController,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(height: 20.0),
                  PasswordTextfield(
                      label: 'Password', passController: _passController),
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
                        _setLoginButton();
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
            replacement: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Login', style: headlineMedium),
                  const SizedBox(height: 24.0),
                  TextField(
                    onTap: _changeToScrollView,
                    decoration: const InputDecoration(
                        hintText: 'Masukan e-mail',
                        hintStyle: hintStyleSmall,
                        contentPadding: EdgeInsets.only(left: 10.0)),
                  ),
                  const SizedBox(height: 18.0),
                  TextField(
                      onTap: _changeToScrollView,
                      decoration: const InputDecoration(
                          hintText: 'Masukan password',
                          hintStyle: hintStyleMedium,
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
                        _changeToScrollView();
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
