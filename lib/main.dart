import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telumerce/services/auth/get_token.dart';
import 'package:telumerce/views/pages/auth/get_started_screen.dart';
import 'package:telumerce/views/pages/fragment/main_window.dart';

import 'const/color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TelU-merce',
      theme: ThemeData(
        backgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: darkBlue,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            shadowColor: Color(0x29000000),
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 14.0, fontWeight: FontWeight.w600, color: darkBlue),
            iconTheme: IconThemeData(
              size: 16.0,
              color: darkBlue,
            )),
        buttonTheme: ButtonThemeData(
            buttonColor: darkBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(darkBlue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0))),
          ),
        ),
      ),
      home: const EntryPoint(),
    );
  }
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  bool isAuthenticated = false;

  Future _getToken() async {
    String? token = await getTheToken();
    int tokenLength = token!.length;

    if (tokenLength <= 0) {
      setState(() => isAuthenticated = true);
    }
  }

  @override
  void initState() {
    super.initState();

    _getToken();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (isAuthenticated) ? const MainWindow(0) : const GetStartedScreen();
  }
}
