import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/model/node_data_dto.dart';

class SearchNodeResponsive with ChangeNotifier {
  List<NodeDataDTO>? nodeDataDTOList = [];

  SearchNodeResponsive({this.nodeDataDTOList}) {
    if (this.nodeDataDTOList == null) {
      this.nodeDataDTOList = [];
    }
  }

  SearchNodeResponsive.fromJson(Map<String, dynamic> json) {
    if (json['nodeDataDTOList'] != null) {
      nodeDataDTOList = <NodeDataDTO>[];
      json['nodeDataDTOList'].forEach((v) {
        nodeDataDTOList!.add(new NodeDataDTO.fromJson(v));
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

  @override
  String toString() {
    return 'SearchNodeResponsive{nodeDataDTOList: $nodeDataDTOList}';
  }
}
