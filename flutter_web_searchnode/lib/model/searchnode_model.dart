class SearchNodeResponsive {
  List<NodeDataDTOList>? nodeDataDTOList;

  SearchNodeResponsive({this.nodeDataDTOList});

  SearchNodeResponsive.fromJson(Map<String, dynamic> json) {
    if (json['nodeDataDTOList'] != null) {
      nodeDataDTOList = <NodeDataDTOList>[];
      json['nodeDataDTOList'].forEach((v) {
        nodeDataDTOList!.add(new NodeDataDTOList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nodeDataDTOList != null) {
      data['nodeDataDTOList'] =
          this.nodeDataDTOList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NodeDataDTOList {
  int? deep;
  int? nextDirectionsTotalValueNumber;
  String? locationAddress;
  List<ListDataInfoDto>? listDataInfoDto;

  NodeDataDTOList(
      {this.deep,
        this.nextDirectionsTotalValueNumber,
        this.locationAddress,
        this.listDataInfoDto});

  NodeDataDTOList.fromJson(Map<String, dynamic> json) {
    deep = json['deep'];
    nextDirectionsTotalValueNumber = json['nextDirectionsTotalValueNumber'];
    locationAddress = json['locationAddress'];
    if (json['listDataInfoDto'] != null) {
      listDataInfoDto = <ListDataInfoDto>[];
      json['listDataInfoDto'].forEach((v) {
        listDataInfoDto!.add(new ListDataInfoDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deep'] = this.deep;
    data['nextDirectionsTotalValueNumber'] =
        this.nextDirectionsTotalValueNumber;
    data['locationAddress'] = this.locationAddress;
    if (this.listDataInfoDto != null) {
      data['listDataInfoDto'] =
          this.listDataInfoDto!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDataInfoDto {
  String? value;
  int? index;
  String? explanation;
  int? totalSameNum;

  ListDataInfoDto(
      {this.value, this.index, this.explanation, this.totalSameNum});

  ListDataInfoDto.fromJson(Map<String, dynamic> json) {
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
}
