import 'package:flutter/material.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/text_theme.dart';

class TopBar extends StatelessWidget {
  TopBar({Key? key, this.text, this.topBarWidget}) : super(key: key);

  String? text;
  Widget? topBarWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: (text == null)
            ? topBarWidget
            : ResponsiveLayout(
                smallMobile: Text(text!, style: titleSmall),
                mediumMobile: Text(text!, style: titleMedium)),
      ),
    );
  }
}
