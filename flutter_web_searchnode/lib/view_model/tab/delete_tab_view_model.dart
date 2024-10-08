import 'package:flutter/cupertino.dart';
import 'package:flutter_web_searchnode/http/searchnode_http_request.dart';
import 'package:flutter_web_searchnode/view_model/tab/common_tab_process_view_model.dart';

class DeleteTabViewModel extends CommonTabProcessViewModel {
  TextEditingController txtEditController = TextEditingController();

  void removeData() async {
    if (isDataValid(controller: txtEditController,controllerName: "Data ")) {
      await sendRequest();
      clearTextField(txtEditController);
      retrieveAllData();
    }
  }

  @override
  sendRequest() async {
    respond = await SearchNodeHttpRequest.removeData(txtEditController.text);
    updateSuccess(respond.isSuccess);
    updateMsg(respond.msg);
  }
}
