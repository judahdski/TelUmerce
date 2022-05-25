import 'package:flutter/material.dart';
import 'package:telumerce/const/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key,
      required this.smallMobile,
      required this.mediumMobile,
      required this.largeMobile})
      : super(key: key);

  final Widget smallMobile;
  final Widget mediumMobile;
  final Widget largeMobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraint) {
        if (constraint.maxWidth < medium) {
          return smallMobile;
        } else if (constraint.maxWidth < large) {
          return mediumMobile;
        } else {
          return largeMobile;
        }
      },
    );
  }
}
