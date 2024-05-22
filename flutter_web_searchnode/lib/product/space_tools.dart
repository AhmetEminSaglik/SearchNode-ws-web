import 'package:flutter/material.dart';

Widget CustomDivider({Color color=Colors.white}) {
  return Column(
    children: [
      Container(
        height: 3,
        width: double.infinity,
        color: color,
      ),
      HeightSpace(10),
    ],
  );
}

SizedBox HeightSpace([double height = 5]) => SizedBox(height: height);
