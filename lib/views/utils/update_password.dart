import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/services/user/update_password_service.dart';
import 'package:telumerce/views/utils/edit_profile.dart';
import 'package:telumerce/views/widgets/password_textfields.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController _oldPassController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final TextEditingController _passConfirmationController =
      TextEditingController();

  String msg = '';

  bool sanitationCheck() {
    var oldPassword = _oldPassController.text;
    var newPassword = _passController.text;
    var newPassConfirmation = _passConfirmationController.text;

    if (oldPassword == '') {
      msg = 'Password lama harap diisi.';
      return false;
    }
    if (newPassword == '') {
      msg = 'Password baru harap diisi.';
      return false;
    }
    if (newPassConfirmation == '') {
      msg = 'Harap konfirmasi ulang password baru anda.';
      return false;
    }
    if (oldPassword == newPassword) {
      msg = 'Password baru harus berbeda dengan yang lama.';
      return false;
    }
    if (newPassword != newPassConfirmation) {
      msg = 'Password baru harus sama';
      return false;
    }

    return true;
  }

  Future _updatePassword() async {
    var oldPassword = _oldPassController.text;
    var newPassword = _passController.text;
    var newPassConfirmation = _passConfirmationController.text;

    if(!sanitationCheck())  {
      final snackbar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }

    final response = await updatePasswordService(oldPassword, newPassword, newPassConfirmation);

    if (response.isSuccessful) {
      msg = 'Berhasil';
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()), (Route<dynamic> route) => false);
    } else {
      msg = response.errorMessage!;
    }

    final snackbar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

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
              passController: _oldPassController,
              label: 'Password lama',
            ),
            const SizedBox(height: 16.0),
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
                _updatePassword();
              },
              child: const Text('Ganti password'),
            )
          ],
        ),
      ),
    );
  }
}
