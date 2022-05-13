import 'package:flutter/material.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(MediaQuery.of(context).size.width.toStringAsFixed(2)),
    );
  }
}
