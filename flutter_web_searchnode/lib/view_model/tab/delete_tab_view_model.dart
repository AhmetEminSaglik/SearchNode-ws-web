import 'package:flutter/cupertino.dart';
import 'package:flutter_web_searchnode/http/searchnode_http_request.dart';
import 'package:flutter_web_searchnode/product/respond_data.dart';
import 'package:flutter_web_searchnode/view_model/tab/common_tab_process_view_model.dart';

class DeleteTabViewModel extends CommonTabProcessViewModel {
  TextEditingController txtEditController = TextEditingController();

  late bool isSuccess;

  bool isDataValid() {
    return txtEditController.text.isNotEmpty;
  }

  void removeData(BuildContext context) async {
    if (isDataValid()) {
      RespondDataResult respond =
          await SearchNodeHttpRequest.removeData(txtEditController.text);
      isSuccess = respond.isSuccess;
      _clearTextField(isSuccess);
      _showMsg(respond.msg);
      retrieveAllData(context);
    } else {
      isSuccess = false;
      _showMsg("Length must be at least 1 character.");
    }
  }

  void _clearTextField(bool result) {
    if (result) {
      txtEditController.clear();
    }
  }

  void _showMsg(String respondMsg) {
    msg = respondMsg;
    notifyListeners();
  }
}
