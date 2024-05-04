import 'dart:convert';
import 'dart:core';

import 'package:flutter_web_searchnode/http/base_http_config.dart';
import 'package:flutter_web_searchnode/http/http_util.dart';
import 'package:flutter_web_searchnode/model/searchnode_model.dart';
import 'package:flutter_web_searchnode/repository/searchnode_repository.dart';
import 'package:http/http.dart' as http;

class SearchNodeHttpRequest {
  static const String _classUrl = "/searchnode";
  static String _baseUrl = BaseHttpConfig.baseUrl + _classUrl;

  static Future<SearchNodeResponsive> getAllSearchNodeData() async {
    Uri url = Uri.parse(_baseUrl);
    print("Link : $url");
    var respond = await http.get(url, headers: HttpUtil.header);
    Map<String, dynamic> map = json.decode(respond.body);
    print("veri cekildi $map");
    return RepositorySearchNode.parseToSearchNode(map);
  }

  static Future<SearchNodeResponsive> addSearchNodeData(
      String data, String explanation) async {
    Uri url = Uri.parse(_baseUrl);
    Map<String, dynamic> requestData = {
      "data": data,
      "explanation": explanation,
    };
    print("Map : $requestData");
    print("Link : $url");
    var respond = await http.post(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    Map<String, dynamic> map = json.decode(respond.body);
    return RepositorySearchNode.parseToSearchNode(map);
  }
}
