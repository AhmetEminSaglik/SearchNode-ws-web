import 'package:flutter/cupertino.dart';
import 'package:flutter_web_searchnode/http/searchnode_http_request.dart';
import 'package:flutter_web_searchnode/view_model/tab/common_tab_process_view_model.dart';

class UpdateExplanationViewModel extends CommonTabProcessViewModel {
  TextEditingController dataController = TextEditingController();
  TextEditingController oldExplanationController = TextEditingController();
  TextEditingController newExplanationController = TextEditingController();

  Future<void> update() async {
    if (isDataValid(controller: dataController,controllerName: "Data ")) {
      await sendRequest();
      _clearTextFields();
      await retrieveAllData();
    }
  }

  @override
  sendRequest() async{
    String data = dataController.text;
    String oldExp = oldExplanationController.text;
    String newExp = newExplanationController.text;
    respond = await SearchNodeHttpRequest.updateExplanation(data,oldExp,newExp);
    updateSuccess(respond.isSuccess);
    print('Buraya gelen respond :${respond}');
    updateMsg(respond.msg);
  }

  _clearTextFields() {
    clearTextField(dataController);
    clearTextField(oldExplanationController);
    clearTextField(newExplanationController);
  }
}
