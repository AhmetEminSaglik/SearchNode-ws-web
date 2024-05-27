import 'dart:convert';
import 'dart:core';

import 'package:flutter_web_searchnode/http/base_http_config.dart';
import 'package:flutter_web_searchnode/http/http_util.dart';
import 'package:flutter_web_searchnode/model/searchnode_model.dart';
import 'package:flutter_web_searchnode/product/response_data.dart';
import 'package:flutter_web_searchnode/repository/searchnode_repository.dart';
import 'package:http/http.dart' as http;

class SearchNodeHttpRequest {
  static const String _classUrl = "/searchnode";
  static String _baseUrl = BaseHttpConfig.baseUrl + _classUrl;

  static Future<SearchNodeResponsive> getAllSearchNodeData() async {
    Uri url = Uri.parse(_baseUrl);
    print("URL : $url");
    var response = await http.get(url, headers: HttpUtil.header);
    String responseBody=utf8.decode(response.bodyBytes);
    Map<String, dynamic> map = json.decode(responseBody);
    print("veri cekildi $map");
    return RepositorySearchNode.parseToSearchNode(map);
  }

  static Future<ResponseDataResult> addSearchNodeData(
      String data, String explanation) async {
    Uri url = Uri.parse(_baseUrl);
    Map<String, dynamic> requestData = {
      "data": data,
      "explanation": explanation,
    };
    print("Map : $requestData");
    print("URL : $url");
    var response = await http.post(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    // Map<String, dynamic> map = json.decode(response.body);
    // return RepositorySearchNode.parseToSearchNode(map);
    ResponseDataResult responseDataResult =
        ResponseDataResult.fromJson(json.decode(response.body));
    return responseDataResult;
  }

  static Future<ResponseDataResult> removeData(String data) async {
    Uri url = Uri.parse(_baseUrl);
    Map<String, String> map = {"data": data};
    print("URL $url");
    var response = await http.delete(url,
        headers: HttpUtil.header, body: json.encode(map));
    print("response : ${response}");
    print("response : ${response.body}");
    ResponseDataResult responseDataResult =
        ResponseDataResult.fromJson(json.decode(response.body));
    return responseDataResult;
  }

  static Future<ResponseDataResult> updateExplanation(
      String data, String oldExp, String newExp,) async {
    Uri url = Uri.parse("$_baseUrl/explanations");
    Map<String, dynamic> requestData = {
      "data": data,
      "oldExplanation": oldExp,
      "newExplanation": newExp,
    };
    print("Map : $requestData");
    print("URL : $url");
    var response = await http.put(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    // Map<String, dynamic> map = json.decode(response.body);
    // return RepositorySearchNode.parseToSearchNode(map);
    ResponseDataResult responseDataResult =
    ResponseDataResult.fromJson(json.decode(response.body));
    return responseDataResult;
  }

  static Future<ResponseDataResult> updateCharacterList(String charToNext, String charList) async {
    Uri url = Uri.parse("$_baseUrl/chars/update");
    Map<String, dynamic> requestData = {
      "charToNext": charToNext,
      "charList": charList,
    };
    print("Map : $requestData");
    print("URL : $url");
    var response = await http.put(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    ResponseDataResult responseDataResult =
    ResponseDataResult.fromJson(json.decode(response.body));
    return responseDataResult;
  }


  static Future<ResponseDataResult> resetCharacterList(String charList) async {
    Uri url = Uri.parse("$_baseUrl/chars/reset");
    Map<String, dynamic> requestData = {
      "charList": charList,
    };
    print("Map : $requestData");
    print("URL : $url");
    var response = await http.put(url,
        headers: HttpUtil.header, body: json.encode(requestData));
    ResponseDataResult responseDataResult =
    ResponseDataResult.fromJson(json.decode(response.body));
    return responseDataResult;
  }

  static Future<ResponseDataResult> resetAllCharacters() async {
    Uri url = Uri.parse("$_baseUrl/chars/reset-all");
    print("URL : $url");
    var response = await http.put(url,
        headers: HttpUtil.header);
    ResponseDataResult responseDataResult =
    ResponseDataResult.fromJson(json.decode(response.body));
    return responseDataResult;
  }

}
