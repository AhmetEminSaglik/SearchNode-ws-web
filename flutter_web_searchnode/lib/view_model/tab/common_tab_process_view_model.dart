import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/view_model/result_view_model.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
import 'package:provider/provider.dart';

abstract class CommonTabProcessViewModel with ChangeNotifier {
  String msg = "";

  retrieveAllData(BuildContext context) async {
    await Provider.of<SearchNodeAreaViewModel>(context, listen: false)
        .retrieveSearchNodeData();
    _updateResultLog(context);
  }

  updateMsg(String text) {
    msg = text;
    notifyListeners();
  }

  _updateResultLog(BuildContext context) async {
    await Provider.of<ResultViewModel>(context, listen: false)
        .updateResultLogs();
  }
}
