import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/custom_common_tab_widget.dart';
import 'package:flutter_web_searchnode/product/custom_edittext_with_title.dart';
import 'package:flutter_web_searchnode/product/custom_location.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';
import 'package:flutter_web_searchnode/product/space_tools.dart';
import 'package:flutter_web_searchnode/tools/CustomColors.dart';
import 'package:flutter_web_searchnode/view_model/tab/delete_tab_view_model.dart';
import 'package:provider/provider.dart';

class DeleteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: Colors.white.withOpacity(0.8),
            child: CustomTabTitle(text: "Deleting Process", color: Colors.red)),
        HeightSpace(15),
        CustomDivider(),
        _getDeleteCard(context),
      ],
    );
  }

  Widget _getResultMsg() {
    return Consumer<DeleteTabViewModel>(
      builder: (context, vm, child) {
        if (vm.msg.isNotEmpty && vm.isSuccess != null) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              color: CustomMsgContainerBackgroundStyle(vm.isSuccess),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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

  Widget _getDeleteCard(BuildContext context) {
    DeleteTabViewModel vm =
        Provider.of<DeleteTabViewModel>(context, listen: false);
    return Card(
      color: CustomColors.opacityLightBlue,
      child: Column(
        children: [
          InputFieldWithTitle(
              title: "Data",
              controller: vm.txtEditController,
              hintText: "Type data to delete"),
          CustomButtonLocation_BottomRight(CustomElevatedButton(
              text: "Delete",
              function: () async {
                vm.removeData();
              })),
          _getResultMsg(),
        ],
      ),
    );
  }
}
