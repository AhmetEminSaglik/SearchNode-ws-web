import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';

InputFieldWithTitle({String title="", required TextEditingController controller,int maxLength=-1,String hintText=""}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title : ", style: CustomTextStyleForInputLabel()),
        SizedBox(height: 5),
        CustomTextField(controller: controller,hintText: hintText,maxLength: maxLength),
      ],
    ),
  );
}

Widget CustomTextField({required TextEditingController controller, String hintText="", int maxLength=-1} ) {
  const double _borderWidth = 3;
  const double _borderRadious = 5;
  return TextField(
    maxLength: maxLength>0 ? maxLength : null,
    style: CustomTextStyleForInput(),
    decoration: InputDecoration(
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadious),
          borderSide:
              const BorderSide(width: _borderWidth, color: Colors.blue)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadious),
          borderSide:
              const BorderSide(width: _borderWidth, color: Colors.black)),
    ),
    controller: controller,
  );
}
