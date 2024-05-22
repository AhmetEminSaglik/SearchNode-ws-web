import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/tools/CustomColors.dart';

/*getCustomCard({required Widget child}) {
  return Card(
    color: CustomColors.opacityLightBlue,
    child: child,
  );
}*/

class CustomCard extends StatelessWidget {
  final Widget child;

  CustomCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.opacityLightBlue,
      child: child,
    );
  }
}
