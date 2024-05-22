import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/custom_card.dart';
import 'package:flutter_web_searchnode/product/custom_common_tab_widget.dart';
import 'package:flutter_web_searchnode/product/custom_edit_text_with_title.dart';
import 'package:flutter_web_searchnode/product/custom_location.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';
import 'package:flutter_web_searchnode/product/space_tools.dart';
import 'package:flutter_web_searchnode/tools/CustomColors.dart';
import 'package:flutter_web_searchnode/view_model/tab/save_tab_view_model.dart';
import 'package:provider/provider.dart';

class SaveTab extends StatelessWidget {
  // TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color:CustomColors.opacityWhite,
            child: CustomTabTitle(text: "Saving Process", color: Colors.blue)),
        HeightSpace(15),
        CustomDivider(),
        _getSaveCard(context),
      ],
    );
  }

  Widget _getSaveButton(BuildContext context, String text) {
    return CustomElevatedButton(
        text: text,
        function: () async {
          // await Provider.of<SearchNodeAreaViewModel>(context, listen: false)
          //     .addSearchNode(controllerData.text, controllerExplanation.text);
          await Provider.of<SaveTabViewModel>(context, listen: false)
              .saveData();
        });
  }

  Widget _getResultMsg() {
    return Consumer<SaveTabViewModel>(
      builder: (context, vm, child) {
        if (vm.msg.isNotEmpty && vm.isSuccess != null) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: CustomMsgContainerBackgroundStyle(vm.isSuccess),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  vm.msg,
                  style: CustomTextStyleForResultMsg(),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _getSaveCard(BuildContext context) {
    SaveTabViewModel vm = Provider.of<SaveTabViewModel>(context, listen: false);
    return CustomCard(
        child: Column(
      children: [
        InputFieldWithTitle(
            title: "Data",
            controller: vm.controllerData,
            hintText: "Type to add Data"),
        InputFieldWithTitle(
            title: "Examination",
            controller: vm.controllerExplanation,
            hintText: "Type to add Explanation"),
        CustomButtonLocation_BottomRight(_getSaveButton(context, "Save")),
        _getResultMsg(),
      ],
    ));
  }
}
