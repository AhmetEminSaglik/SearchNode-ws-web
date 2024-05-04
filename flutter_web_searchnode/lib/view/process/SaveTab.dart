import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/CustomTextStyle.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
import 'package:provider/provider.dart';

class SaveTab extends StatelessWidget {
  TextEditingController controllerData = TextEditingController(text: "Test 1");
  TextEditingController controllerExplanation = TextEditingController(text: "Test 2");

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
              _getSaveButton(context, "Save"),
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

  Widget _getSaveButton(BuildContext context, String text) {
    return CustomElevatedButton(
        text: text,
        function: () {
          print("controllerData : ${controllerData.text}");
          print("controllerExplanation : ${controllerExplanation.text}");
          SearchNodeAreaViewModel vm =
              Provider.of<SearchNodeAreaViewModel>(context, listen: false);
          vm.addSearchNode(controllerData.text, controllerExplanation.text);
        });


  }
}
