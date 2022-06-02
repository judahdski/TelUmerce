import 'package:flutter/material.dart';
import 'package:telumerce/const/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key,
      required this.smallMobile,
      required this.mediumMobile})
      : super(key: key);

  final Widget smallMobile;
  final Widget mediumMobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraint) {
      if (constraint.maxWidth < medium) {
        return smallMobile;
      } else {
        return mediumMobile;
      }
    });
  }
}
