class DataInfoDTO {
  String? value;
  int? index;
  String? explanation;
  int? totalSameNum;

  DataInfoDTO(
      {this.value, this.index, this.explanation, this.totalSameNum});

  DataInfoDTO.fromJson(Map<String, dynamic> json) {
    // print('\n!!!!!!! json :$json');
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
