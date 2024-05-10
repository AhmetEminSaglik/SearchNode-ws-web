import 'dart:convert';
import 'dart:core';

import 'package:flutter_web_searchnode/http/base_http_config.dart';
import 'package:flutter_web_searchnode/http/http_util.dart';
import 'package:flutter_web_searchnode/model/searchnode_model.dart';
import 'package:flutter_web_searchnode/product/respond_data.dart';
import 'package:flutter_web_searchnode/repository/searchnode_repository.dart';
import 'package:http/http.dart' as http;

class SearchNodeHttpRequest {
  static const String _classUrl = "/searchnode";
  static String _baseUrl = BaseHttpConfig.baseUrl + _classUrl;

  static Future<SearchNodeResponsive> getAllSearchNodeData() async {
    Uri url = Uri.parse(_baseUrl);
    print("URL : $url");
    var respond = await http.get(url, headers: HttpUtil.header);
    Map<String, dynamic> map = json.decode(respond.body);
    print("veri cekildi $map");
    return RepositorySearchNode.parseToSearchNode(map);
  }

  static Future<RespondDataResult> addSearchNodeData(
      String data, String explanation) async {
    Uri url = Uri.parse(_baseUrl);
    Map<String, dynamic> requestData = {
      "data": data,
      "explanation": explanation,
    };
    print("Map : $requestData");
    print("URL : $url");
    var respond = await http.post(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    // Map<String, dynamic> map = json.decode(respond.body);
    // return RepositorySearchNode.parseToSearchNode(map);
    RespondDataResult respondDataResult =
        RespondDataResult.fromJson(json.decode(respond.body));
    return respondDataResult;
  }

  static Future<RespondDataResult> removeData(String data) async {
    Uri url = Uri.parse(_baseUrl);
    Map<String, String> map = {"data": data};
    print("URL $url");
    var respond = await http.delete(url,
        headers: HttpUtil.header, body: json.encode(map));
    print("respond : ${respond}");
    print("respond : ${respond.body}");
    RespondDataResult respondDataResult =
        RespondDataResult.fromJson(json.decode(respond.body));
    return respondDataResult;
  }

  static Future<RespondDataResult> updateExplanation(
      String data, String oldExp, String newExp,) async {
    Uri url = Uri.parse("$_baseUrl/explanations");
    Map<String, dynamic> requestData = {
      "data": data,
      "oldExplanation": oldExp,
      "newExplanation": newExp,
    };
    print("Map : $requestData");
    print("URL : $url");
    var respond = await http.put(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    // Map<String, dynamic> map = json.decode(respond.body);
    // return RepositorySearchNode.parseToSearchNode(map);
    RespondDataResult respondDataResult =
    RespondDataResult.fromJson(json.decode(respond.body));
    return respondDataResult;
  }

  static Future<RespondDataResult> updateCharacterList(String charToNext, String charList) async {
    Uri url = Uri.parse("$_baseUrl/chars/update");
    Map<String, dynamic> requestData = {
      "charToNext": charToNext,
      "charList": charList,
    };
    print("Map : $requestData");
    print("URL : $url");
    var respond = await http.put(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    RespondDataResult respondDataResult =
    RespondDataResult.fromJson(json.decode(respond.body));
    return respondDataResult;
  }


  static Future<RespondDataResult> resetCharacterList(String charList) async {
    Uri url = Uri.parse("$_baseUrl/chars/reset");
    Map<String, dynamic> requestData = {
      "charList": charList,
    };
    print("Map : $requestData");
    print("URL : $url");
    var respond = await http.put(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    RespondDataResult respondDataResult =
    RespondDataResult.fromJson(json.decode(respond.body));
    return respondDataResult;
  }

  static Future<RespondDataResult> resetAllCharacters() async {
    Uri url = Uri.parse("$_baseUrl/chars/reset-all");
    print("URL : $url");
    var respond = await http.put(url,
        headers: HttpUtil.header);
    RespondDataResult respondDataResult =
    RespondDataResult.fromJson(json.decode(respond.body));
    return respondDataResult;
  }

}
