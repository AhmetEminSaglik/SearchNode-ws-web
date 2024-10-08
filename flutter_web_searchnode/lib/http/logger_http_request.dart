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
    var response = await http.get(url, headers: HttpUtil.header);
    String responseBody=utf8.decode(response.bodyBytes);
    // List<String> list = (json.decode(response.body) as List<dynamic>)
    List<String> list = (json.decode(responseBody) as List<dynamic>)
        .map((e) => e.toString())
        .toList();
    // Uint8List bodyBytes = response.bodyBytes;
    //
    // List<String> stringList = [];
    // for (int byte in bodyBytes) {
    //   stringList.add(String.fromCharCode(byte));
    // }
    return list;
  }

  static Future<void> clearLogs() async {
    Uri url = Uri.parse(_baseUrl);
    print("Link : $url");
    var response = await http.delete(url, headers: HttpUtil.header);
    print("Response : $response");
  }
}
