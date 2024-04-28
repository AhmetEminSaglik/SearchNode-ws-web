import 'dart:convert';

import 'package:flutter_web_searchnode/http/BaseHttpConfig.dart';
import 'package:flutter_web_searchnode/http/http_util.dart';
import 'package:flutter_web_searchnode/model/searchnode_model.dart';
import 'package:flutter_web_searchnode/repository/SearchNodeRepository.dart';
import 'package:http/http.dart' as http;

class SearchNodeHttpRequest {
  static String _baseUrl = BaseHttpConfig.baseUrl;

  static Future<SearchNodeResponsive> getAllSearchNodeData() async {
    Uri url = Uri.parse(_baseUrl);
    print("Link : $url");
    var data = await http.get(url, headers: HttpUtil.header);
    Map<String, dynamic> map = json.decode(data.body);
    return RepositorySearchNode.parseToSearchNode(map);
  }
}
