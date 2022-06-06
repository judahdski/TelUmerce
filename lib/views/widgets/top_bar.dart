import 'package:flutter/material.dart';

import '../../const/text_theme.dart';

class TopBar extends StatelessWidget {
  TopBar({Key? key, this.text, this.topBarWidget}) : super(key: key);

  String? text;
  Widget? topBarWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color(0xFFF4F4F4), offset: Offset(1, 2), blurRadius: 6.0)
      ]),
      child:  Center(
          child: (text == null)
              ? topBarWidget : Text(text!, style: titleSmall),
      ),
    );
  }
}
