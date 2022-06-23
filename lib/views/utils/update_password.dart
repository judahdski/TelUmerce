import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/views/widgets/password_textfields.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmationController =
      TextEditingController();

  updatePassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
        ),
        title: const Text('Ganti password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
        child: Column(
          children: [
            PasswordTextfield(
              passController: _passController,
              label: 'Password baru',
            ),
            const SizedBox(height: 16.0),
            PasswordTextfield(
              passController: _passConfirmationController,
              label: 'Ulangi password baru',
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                updatePassword();
              },
              child: const Text('Ganti password'),
            )
          ],
        ),
      ),
    );
  }
}
