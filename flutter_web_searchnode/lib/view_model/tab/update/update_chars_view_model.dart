import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/http/searchnode_http_request.dart';
import 'package:flutter_web_searchnode/view_model/tab/common_tab_process_view_model.dart';

class UpdateCharsViewModel extends CommonTabProcessViewModel {
  TextEditingController charToNextController = TextEditingController();
  TextEditingController charListController = TextEditingController();

  Future<void> update() async {
    if (isDataValid(controller: charToNextController,controllerName: "Referance Char ") && isDataValid(controller: charListController ,controllerName: "Characters Text Field ")) {
      await sendRequest();
      _clearTextFields();
      await retrieveAllData();
    }
  }

  @override
  sendRequest() async {
    String charToNext = charToNextController.text;
    String charList = charListController.text;
    respond =
        await SearchNodeHttpRequest.updateCharacterList(charToNext, charList);
    updateSuccess(respond.isSuccess);
    print('Buraya gelen respond :${respond}');
    updateMsg(respond.msg);
  }

  _clearTextFields() {
    clearTextField(charToNextController);
    clearTextField(charListController);
  }
}
