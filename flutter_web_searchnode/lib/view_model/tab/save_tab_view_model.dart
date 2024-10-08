import 'package:flutter/cupertino.dart';
import 'package:flutter_web_searchnode/http/searchnode_http_request.dart';
import 'package:flutter_web_searchnode/view_model/tab/common_tab_process_view_model.dart';

class SaveTabViewModel extends CommonTabProcessViewModel {
  TextEditingController controllerData = TextEditingController();
  TextEditingController controllerExplanation = TextEditingController();

  Future<void> saveData() async {
    if (isDataValid(controller: controllerData,controllerName: "Data ")) {
      await sendRequest();
      _clearTextFields();
      await retrieveAllData();////adding data consecutively and backend gave error although syncronized key word is used. But when added await here, Then all proces worked step by step.
    }
  }

  @override
  sendRequest() async {
    String data = controllerData.text;
    String explanation = controllerExplanation.text;

    respond = await SearchNodeHttpRequest.addSearchNodeData(data, explanation);
    updateSuccess(respond.isSuccess);
    updateMsg(respond.msg);
  }

  _clearTextFields() {
    clearTextField(controllerData);
    clearTextField(controllerExplanation);
  }
}
