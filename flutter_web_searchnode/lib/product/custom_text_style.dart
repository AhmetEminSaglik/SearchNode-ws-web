import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/tools/CustomColors.dart';

TextStyle CustomTextStyleForInput() {
  return TextStyle(fontSize: 18,color: CustomColors.white);
}

TextStyle CustomTextStyleForResultMsg(/*bool success*/) {
  return TextStyle(
      fontSize: 20, color: /*success ?   Colors.green :*/ Colors.black);
}

Color CustomMsgContainerBackgroundStyle(bool success) {
  // return success ? Colors.lightGreenAccent.shade700.withOpacity(0.8) : Colors.red;
  return success ? CustomColors.lightGreen : CustomColors.lightRed;
  // return success ? Colors.green : Colors.red;
}

TextStyle CustomTextStyleForHeaderLabel({Color color = Colors.black}) {
  return TextStyle(fontSize: 30, color: color);
}

TextStyle CustomTextStyleForInputLabel() {
  return TextStyle(fontSize: 20, color: Colors.white);
}

// Widget CustomElevatedButton(String text,Function function(int a)) {
// Widget CustomElevatedButton({required String text, required Function function()}) { function () --> return icermeli
// Widget CustomElevatedButton({required String text, required Function function}) { function --> return gerek yok
Widget CustomElevatedButton(
    {required String text, required Function function}) {
  return SizedBox(
    // height: 30,
    // width: 150,
    child: ElevatedButton(
      onPressed: () {
        function();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
      style: CustomButtonStyle(),
    ),
  );
}

ButtonStyle CustomButtonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
    textStyle:
        MaterialStateProperty.resolveWith((states) => TextStyle(fontSize: 17)),
    minimumSize: MaterialStateProperty.resolveWith((states) => Size(150, 40)),
    // maximumSize:MaterialStateProperty.resolveWith((states) => Size(200, 50))
  );
}
