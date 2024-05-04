import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/http/LoggerHttpRequest.dart';

class ResultViewModel with ChangeNotifier {
  List<String> logs = [];

  ResultViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      retrieveLogData();
    });
  }

  Future<void> retrieveLogData() async {
    logs = await LoggerHttpRequest.getAllLogData();
    notifyListeners();
  }

  Future<void> updateResultLogs() async {
    await retrieveLogData();
  }

  Future<void> clearLogs() async {
    await LoggerHttpRequest.clearLogs();
    logs.clear();
    notifyListeners();
  }
}
