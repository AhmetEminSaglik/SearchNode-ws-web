import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/custom_common_tab_widget.dart';
import 'package:flutter_web_searchnode/product/custom_edittext_with_title.dart';
import 'package:flutter_web_searchnode/product/custom_location.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';
import 'package:flutter_web_searchnode/view_model/result_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/save_tab_view_model.dart';
import 'package:provider/provider.dart';

class SaveTab extends StatelessWidget {
  TextEditingController controllerData = TextEditingController(text: "a");
  TextEditingController controllerExplanation =
      TextEditingController(text: "Test 2");

  // TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomTabTitle(text:"Saving Process"),
        InputFieldWithTitle(
            title: "Data",
            controller: controllerData,
            hintText: "Type to add Data"),
        InputFieldWithTitle(
            title: "Examination",
            controller: controllerExplanation,
            hintText: "Type to add Explanation"),
        CustomButtonLocation_BottomRight(_getSaveButton(context,
            "Save")) /*    Padding(
          padding: const EdgeInsets.only(right: 25),
          child: ButtonBar(
            children: [
              _getSaveButton(context, "Save"),
            ],
          ),
        ),*/
      ],
    );
  }



  Widget _getSaveButton(BuildContext context, String text) {
    return CustomElevatedButton(
        text: text,
        function: () async {
          // await Provider.of<SearchNodeAreaViewModel>(context, listen: false)
          //     .addSearchNode(controllerData.text, controllerExplanation.text);
          await Provider.of<SaveTabViewModel>(context, listen: false).saveData(
              context: context,
              data: controllerData.text,
              explanation: controllerExplanation.text);

          await Provider.of<ResultViewModel>(context, listen: false)
              .updateResultLogs();
        });
  }
}
