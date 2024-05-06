import 'package:flutter/cupertino.dart';
import 'package:flutter_web_searchnode/http/searchnode_http_request.dart';
import 'package:flutter_web_searchnode/view_model/tab/common_tab_process_view_model.dart';

class SaveTabViewModel extends CommonTabProcessViewModel  {
  Future<void> saveData(
      {required BuildContext context,
      required String data,
      required String explanation}) async {
    await SearchNodeHttpRequest.addSearchNodeData(data, explanation);
    retrieveAllData(context);
  }

}
