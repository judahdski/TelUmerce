import 'package:flutter/material.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';

import '../../const/text_theme.dart';

class TopBar extends StatefulWidget {
  TopBar({Key? key, this.text, this.topBarWidget}) : super(key: key);

  String? text;
  Widget? topBarWidget;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: (widget.text == null)
            ? widget.topBarWidget
            : ResponsiveLayout(
                smallMobile: Text(widget.text!, style: titleSmall),
                mediumMobile: Text(widget.text!, style: titleMedium)),
      ),
    );
  }
}
