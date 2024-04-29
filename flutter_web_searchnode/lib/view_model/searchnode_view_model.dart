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

  void clicked(int index) {
    print("${searchNode?.nodeDataDTOList?[index]}");
  }
}
