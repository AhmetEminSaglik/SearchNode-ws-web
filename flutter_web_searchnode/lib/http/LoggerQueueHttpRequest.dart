import 'dart:convert';
import 'dart:core';

import 'package:flutter_web_searchnode/http/BaseHttpConfig.dart';
import 'package:flutter_web_searchnode/http/http_util.dart';
import 'package:flutter_web_searchnode/model/searchnode_model.dart';
import 'package:flutter_web_searchnode/repository/SearchNodeRepository.dart';
import 'package:http/http.dart' as http;

class LoggerQueueHttpRequest {
  static const String _classUrl = "/log";
  static String _baseUrl = BaseHttpConfig.baseUrl + _classUrl;

  static Future<SearchNodeResponsive> getAllLogData() async {
    Uri url = Uri.parse(_baseUrl);
    print("Link : $url");
    var respond = await http.get(url, headers: HttpUtil.header);
    Map<String, dynamic> map = json.decode(respond.body);
    print("veri cekildi $map");
    return RepositorySearchNode.parseToSearchNode(map);
  }
}
