import 'package:flutter/material.dart';

Widget CustomDivider() {
  return Column(
    children: [
      Container(
        height: 3,
        width: double.infinity,
        color: Colors.black,
      ),
      HeightSpace(10),
    ],
  );
}

SizedBox HeightSpace([double height = 5]) => SizedBox(height: height);
