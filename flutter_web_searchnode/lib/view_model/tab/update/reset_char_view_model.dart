import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/http/searchnode_http_request.dart';
import 'package:flutter_web_searchnode/view_model/tab/common_tab_process_view_model.dart';

class ResetCharViewModel extends CommonTabProcessViewModel {
  TextEditingController charListController = TextEditingController();

  Future<void> resetCharacters() async {
    if (isDataValid(controller: charListController,controllerName: "Character list Text Field ")) {
      await sendRequest();
      clearTextField(charListController);
      await retrieveAllData();
    }
  }

  @override
  sendRequest() async {
    String charList = charListController.text;
    respond = await SearchNodeHttpRequest.resetCharacterList(charList);
    updateSuccess(respond.isSuccess);
    updateMsg(respond.msg);
  }
}
