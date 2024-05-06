import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';

Padding CustomTabTitle({required String text, Color color = Colors.black}) {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
          child:
              Text(text, style: CustomTextStyleForHeaderLabel(color: color))));
}
