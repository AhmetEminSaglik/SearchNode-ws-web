class RespondDataResult {
  late bool _isSuccess;
  late String _msg;
  late var _data;

  RespondDataResult.fromJson(Map<String, dynamic> json) {
    _isSuccess = json["success"];
    _msg = json["msg"] ?? "---";
    _data = json["data"] ?? "---";
  }

  get data => _data;

  String get msg => _msg;

  bool get isSuccess => _isSuccess;

  @override
  String toString() {
    return 'RespondDataResult{_isSuccess: $_isSuccess, _msg: $_msg, _data: $_data}';
  }
}
