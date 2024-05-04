import 'dart:convert';
import 'dart:core';

import 'package:flutter_web_searchnode/http/base_http_config.dart';
import 'package:flutter_web_searchnode/http/http_util.dart';
import 'package:http/http.dart' as http;

class LoggerHttpRequest {
  static const String _classUrl = "/log";
  static String _baseUrl = BaseHttpConfig.baseUrl + _classUrl;

  static Future<List<String>> getAllLogData() async {
    Uri url = Uri.parse(_baseUrl);
    print("Link : $url");
    var respond = await http.get(url, headers: HttpUtil.header);
    List<String> list = (json.decode(respond.body) as List<dynamic>)
        .map((e) => e.toString())
        .toList();
    return list;
  }

  static Future<void> clearLogs() async {
    Uri url = Uri.parse(_baseUrl);
    print("Link : $url");
    var respond = await http.delete(url, headers: HttpUtil.header);
    print("Respond : $respond");
  }
}
