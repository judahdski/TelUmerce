import 'package:flutter/material.dart';

class L extends StatelessWidget {
  const L({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('data'),
      ),
    );
  }
}
