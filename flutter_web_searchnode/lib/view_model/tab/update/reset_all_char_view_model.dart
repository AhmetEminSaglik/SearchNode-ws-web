import 'package:flutter_web_searchnode/http/searchnode_http_request.dart';
import 'package:flutter_web_searchnode/view_model/tab/common_tab_process_view_model.dart';

class ResetAllCharViewModel extends CommonTabProcessViewModel {

  Future<void> resetAllCharacters() async {
      await sendRequest();
      await retrieveAllData();
  }
  @override
  sendRequest() async{
    respond = await SearchNodeHttpRequest.resetAllCharacters();
    updateSuccess(respond.isSuccess);
    updateMsg(respond.msg);
  }

}
