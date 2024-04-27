import 'package:flutter_web_searchnode/model/node_data_dto.dart';

class SearchNodeResponsive {
  List<NodeDataDTO>? nodeDataDTOList;

  SearchNodeResponsive({this.nodeDataDTOList});

  SearchNodeResponsive.fromJson(Map<String, dynamic> json) {
    if (json['nodeDataDTOList'] != null) {
      nodeDataDTOList = <NodeDataDTO>[];
      json['nodeDataDTOList'].forEach((v) {
        // NodeDataDTO nodeDataDTO = new NodeDataDTO.fromJson(v);
        // print('nodeDataDTOList ======>>> $nodeDataDTO');
        // nodeDataDTOList!.add(nodeDataDTO);
        print(' nodeDataDto v : $v');
        nodeDataDTOList!.add(new NodeDataDTO.fromJson(v));
        // print("----------------------------\ngelen json : $json");
        // print('\nnodeDataDTOList ${json["nodeDataDTOList"]}');
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
