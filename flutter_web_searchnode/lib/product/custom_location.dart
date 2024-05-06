import 'package:flutter/material.dart';

Widget CustomButtonLocation_BottomRight(Widget widget,{double rightPadding=25}) {
  return Padding(
    padding: EdgeInsets.only(right: rightPadding),
    child: ButtonBar(
      children: [widget],
    ),
  );
}

Widget CustomButtonLocation_BottomCenter(Widget widget) {
  return Center(
    child: widget,
  );
}
