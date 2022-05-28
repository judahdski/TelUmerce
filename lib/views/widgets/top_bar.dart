import 'package:flutter/material.dart';

import '../../const/text_theme.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color(0xFFF3F3F3), offset: Offset(1, 2), blurRadius: 6.0)
      ]),
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child:  Center(child: Text(text, style: titleSmall)),
    );
  }
}
