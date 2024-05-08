import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/custom_common_tab_widget.dart';
import 'package:flutter_web_searchnode/product/custom_edittext_with_title.dart';
import 'package:flutter_web_searchnode/product/custom_location.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';
import 'package:flutter_web_searchnode/product/space_tools.dart';
import 'package:flutter_web_searchnode/view_model/tab/delete_tab_view_model.dart';
import 'package:provider/provider.dart';

class DeleteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeleteTabViewModel vm =
        Provider.of<DeleteTabViewModel>(context, listen: false);
    return Column(
      children: [
        CustomTabTitle(text: "Deleting Process", color: Colors.red),
        HeightSpace(15),
        CustomDivider(),
        InputFieldWithTitle(
            title: "Data",
            controller: vm.txtEditController,
            hintText: "Type data to delete"),
        CustomButtonLocation_BottomRight(CustomElevatedButton(
            text: "Delete",
            function: () async {
              vm.removeData();
              // DeleteTabViewModel vm =
              //     await Provider.of<DeleteTabViewModel>(context, listen: false);

              // RespondDataResult respondDataResult = await vm.removeData(
              //     context: context, data: deleteBtnController.text);

              // if (respondDataResult.isSuccess) {
              //   deleteBtnController.clear();
              // }
            })),
        _getResultMsg(),
      ],
    );
  }

  Widget _getResultMsg() {
    return Consumer<DeleteTabViewModel>(
      builder: (context, vm, child) {
        if (vm.msg.isNotEmpty && vm.isSuccess != null) {
          return Text(
            vm.msg,
            style: CustomTextStyleForResultMsg(vm.isSuccess),
          );
        }
        return Container();
      },
    );
  }
}
