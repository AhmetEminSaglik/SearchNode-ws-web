import 'package:flutter/cupertino.dart';
import 'package:flutter_web_searchnode/http/SearchNodeHttpRequest.dart';
import 'package:flutter_web_searchnode/model/searchnode_model.dart';

class SearchNodeAreaViewModel with ChangeNotifier {
  SearchNodeResponsive? searchNode;

  SearchNodeAreaViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await retrieveSearchNodeData();
    });
  }

  retrieveSearchNodeData() async {
    searchNode = await SearchNodeHttpRequest.getAllSearchNodeData();
    notifyListeners();
  }

  void addSearchNode(String data, String explanation) async{
    await SearchNodeHttpRequest.addSearchNodeData(data, explanation);
    await retrieveSearchNodeData();
  }

  void clicked(int index) {
    print("${searchNode?.nodeDataDTOList?[index]}");
  }

  // static int counter = 1;

  int getNodeDataListSize() {
    // print('$counter kez geldi');
    // counter++;
    if (searchNode != null && searchNode!.nodeDataDTOList != null) {
      return searchNode!.nodeDataDTOList!.length;
    }
    return 0;
  }
}
