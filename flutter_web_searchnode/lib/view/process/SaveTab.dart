import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/CustomTextStyle.dart';

class SaveTab extends StatelessWidget {
  TextEditingController controllerData = TextEditingController();
  TextEditingController controllerExplanation = TextEditingController();

  // TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _getTitle(),
        _getInputFieldWithTitle("Data", controllerData),
        _getInputFieldWithTitle("Examination", controllerExplanation),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: ButtonBar(
            children: [
              _getSaveButton("Save"),
            ],
          ),
        ),
      ],
    );
  }

  Padding _getTitle() {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
            child: Text("Saving Process",
                style: CustomTextStyleForHeaderLabel())));
  }

  _getInputFieldWithTitle(String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$text : ", style: CustomTextStyleForInputLabel()),
          SizedBox(height: 5),
          _getTextField(controller)
        ],
      ),
    );
  }

  Widget _getTextField(TextEditingController controller) {
    const double _borderWidth = 3;
    const double _borderRadious = 5;
    return TextField(
      style: CustomTextStyleForInput(),
      decoration: InputDecoration(
        hintText: "Hint text",
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

  Widget _getSaveButton(String text) {
    return CustomElevatedButton(
        text: text,
        function: () {
          print("controllerData : ${controllerData.text}");
          print("controllerExplanation : ${controllerExplanation.text}");
        });
  }
}
