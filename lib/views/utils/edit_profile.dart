import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/auth/logout_auth_services.dart';
import 'package:telumerce/services/user/get_user_services.dart';
import 'package:telumerce/services/user/update_profile_user_services.dart';
import 'package:telumerce/views/pages/auth/login_screen.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../model/user.dart';
import '../widgets/regular_textfields.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  User? user;

  final TextEditingController _namaController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneNumController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  logout() async {
    var response = await logoutService();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    var snackBar = SnackBar(content: Text(response.data as String));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  getUserInfo() async {
    final response = await getUserService();
    user = (response.data) as User;

    _namaController.text = user!.name;
    _emailController.text = user!.email;
    _phoneNumController.text = user!.noTelp;
    _addressController.text = user!.alamat;
  }

  updateProfile() async {
    final response = await updateProfileServices(
      _namaController.text,
      _emailController.text,
      _phoneNumController.text,
      _addressController.text,
    );

    if (response.isSuccessful) {
      var successMsg = (response.data) as String;
      final snackbar = SnackBar(content: Text(successMsg));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      var failedMsg = response.errorMessage;
      final snackbar = SnackBar(content: Text(failedMsg!));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  void initState() {
    super.initState();

    getUserInfo();
  }

  // UI
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
        title: const Text('Edit profile'),
      ),
      body: ResponsiveLayout(
        smallMobile: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              alignment: Alignment.center,
              child: SizedBox(
                height: 80.0,
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0x3d949494),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: const Center(
                            child: FaIcon(
                          FontAwesomeIcons.pencil,
                          size: 24.0,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
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

            // u p d a t e   p a s s w o r d
            TextField(
              onTap: () {
                // TODO = navigate to update password screen
                var alertDialog = const AlertDialog(
                  title: Text("hiii"),
                );
                showDialog(context: context, builder: (_) => alertDialog);
              },
              decoration: InputDecoration(
                label: const Text("Password"),
                labelStyle: const TextStyle(fontSize: 13.0),
                contentPadding: const EdgeInsets.all(12.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffcdcdcd)),
                    borderRadius: BorderRadius.circular(6.0)),
              ),
            ),
            const SizedBox(height: 16.0),
            RegularTextfields(
                label: 'Nomor HP',
                hint: 'Masukan nomor hp',
                autoFocus: false,
                controller: _phoneNumController,
                inputType: TextInputType.number),
            const SizedBox(height: 16.0),
            RegularTextfields(
                label: 'Alamat',
                hint: 'Masukan alamat',
                autoFocus: false,
                controller: _addressController,
                inputType: TextInputType.streetAddress),
            const SizedBox(height: 32.0),
            ElevatedButton(
                onPressed: () {
                  updateProfile();
                },
                child: const Text('Simpan')),
            OutlinedButton(
                onPressed: () {
                  logout();
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
        mediumMobile: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              alignment: Alignment.center,
              child: SizedBox(
                height: 80.0,
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0x3d949494),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: const Center(
                            child: FaIcon(
                          FontAwesomeIcons.pencil,
                          size: 24.0,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
            RegularTextfields(
                label: 'Nomor HP',
                hint: 'Masukan nomor hp',
                autoFocus: false,
                controller: _phoneNumController,
                inputType: TextInputType.number),
            const SizedBox(height: 16.0),
            RegularTextfields(
                label: 'Alamat',
                hint: 'Masukan alamat',
                autoFocus: false,
                controller: _addressController,
                inputType: TextInputType.streetAddress),
            const SizedBox(height: 32.0),
            ElevatedButton(
                onPressed: () {
                  updateProfile();
                },
                child: const Text('Simpan')),
            const SizedBox(height: 8.0),
            OutlinedButton(
                onPressed: () {
                  logout();
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      ),
    );
  }
}
