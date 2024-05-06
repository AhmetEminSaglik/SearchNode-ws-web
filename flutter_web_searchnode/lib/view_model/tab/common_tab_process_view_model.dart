import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/respond_data.dart';
import 'package:flutter_web_searchnode/tools/SingletonBuildContext.dart';
import 'package:flutter_web_searchnode/tools/locator.dart';
import 'package:flutter_web_searchnode/view_model/result_view_model.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
import 'package:provider/provider.dart';

abstract class CommonTabProcessViewModel with ChangeNotifier {
  BuildContext _context = locator<SingletonBuildContext>().context;

  String _msg = "";
  @protected
  final invalidCharLengthErrMsg = "Length must be at least 1 character.";
  @protected
  late bool isSuccess;
  @protected
  late RespondDataResult respond;

  @protected
  String get msg => _msg;

  @protected
  sendRequest();

  @protected
  updateSuccess(bool success) {
    isSuccess = success;
  }

  @protected
  retrieveAllData() async {
    await Provider.of<SearchNodeAreaViewModel>(_context, listen: false)
        .retrieveSearchNodeData();
    _updateResultLog();
  }

  @protected
  bool isDataValid(TextEditingController controller) {
    bool result = controller.text.isNotEmpty;
    if (!result) {
      String errMsg = invalidCharLengthErrMsg;
      updateSuccess(false);
      updateMsg(errMsg);
    }
    return result;
  }

  @protected
  void clearTextField(TextEditingController controller) {
    if (isSuccess) {
      controller.clear();
    }
  }

  @protected
  updateMsg(String text) {
    _msg = text;
    notifyListeners();
  }

  @protected
  _updateResultLog() async {
    // BuildContext _context=locator<SingletonBuildContext>().context;
    await Provider.of<ResultViewModel>(_context, listen: false)
        .updateResultLogs();
    // print("context  == _context ${context==_context}");
  }
}
