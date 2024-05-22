import 'package:flutter/material.dart';

Container CustomCircularShapeIntValue(
    {required int value,
    Color color = Colors.black,
    Color backgroundColor = Colors.white}) {
  return Container(
    width: 30,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.circular(50)),
    child: Text("$value",
        style:
            TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold)),
  );
}

Widget CustomCircularShapeIconButton(
    {required IconData iconData,
    required Function() onPressed,
    Color color = Colors.black,
    Color backgroundColor = Colors.white}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 30,
      height: 30,
      // child: iconButton,
      alignment: Alignment.center,
      child: Icon(iconData,color: color),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(50)),
    ),
  );
}
