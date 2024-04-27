import 'package:flutter/cupertino.dart';
import 'package:flutter_web_searchnode/http/SearchNodeHttpRequest.dart';
import 'package:flutter_web_searchnode/model/searchnode_model.dart';

class SearchNodeAreaViewModel with ChangeNotifier {
  List<SearchNodeResponsive> snList = [];

  void _retrieveSearchNodeData() async {
    // List<SearchNodeResponsive> snList
    SearchNodeResponsive searchNode= await SearchNodeHttpRequest.getAllSearchNodeData();
    // for (var value in snList) {
    //   print("value $value");
    // }
  }

  SearchNodeAreaViewModel(){
    _retrieveSearchNodeData();
  }
}
