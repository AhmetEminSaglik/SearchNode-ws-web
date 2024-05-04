class DataInfoDTO {
  late String value;
  late int index;
  late String explanation;
  late int totalSameNum;

  DataInfoDTO(
      {required String value,
      required int index,
      required String explanation,
      required int totalSameNum}) {
    this.value = value;
    this.index = index;
    this.explanation = explanation;
    this.totalSameNum = totalSameNum;
  }

  DataInfoDTO.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    index = json['index'];
    explanation = json['explanation'];
    totalSameNum = json['totalSameNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['index'] = this.index;
    data['explanation'] = this.explanation;
    data['totalSameNum'] = this.totalSameNum;
    return data;
  }

  @override
  String toString() {
    return 'DataInfoDto{value: $value, index: $index, explanation: $explanation, totalSameNum: $totalSameNum}';
  }
}
