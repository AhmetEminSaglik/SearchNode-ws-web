import 'package:flutter_web_searchnode/model/searchnode_model.dart';

class RepositorySearchNode {
  static SearchNodeResponsive parseToSearchNode(Map<String, dynamic> json) {
    return SearchNodeResponsive.fromJson(json);
  }
}
