import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/model/data_info_dto.dart';

class NodeDataDTO with ChangeNotifier {
  late int deep;
  late int nextDirectionsTotalValueNumber=0;
  late String locationAddress="";
  late List<DataInfoDTO> listDataInfoDTO=[];

  NodeDataDTO({ required int deep, required  int nextDirectionsTotalValueNumber,
    required String locationAddress, required List<DataInfoDTO> listDataInfoDTO}) {
    this.deep = deep;
    this.nextDirectionsTotalValueNumber = nextDirectionsTotalValueNumber;
    this.locationAddress = locationAddress;
    if (listDataInfoDTO != null) {
      this.listDataInfoDTO = listDataInfoDTO;
    }
  }

  NodeDataDTO.fromJson(Map<String, dynamic> json) {
    deep = json['deep'];
    nextDirectionsTotalValueNumber = json['nextDirectionsTotalValueNumber'];
    locationAddress = json['locationAddress'];
    if (json['listDataInfoDTO'] != null) {
      listDataInfoDTO = <DataInfoDTO>[];
      json['listDataInfoDTO'].forEach((v) {
        listDataInfoDTO!.add(DataInfoDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deep'] = this.deep;
    data['nextDirectionsTotalValueNumber'] =
        this.nextDirectionsTotalValueNumber;
    data['locationAddress'] = this.locationAddress;
    if (this.listDataInfoDTO != null) {
      data['listDataInfoDTO'] =
          this.listDataInfoDTO!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'NodeDataDTO{deep: $deep, nextDirectionsTotalValueNumber: $nextDirectionsTotalValueNumber, locationAddress: $locationAddress, list: $listDataInfoDTO}';
  }
}
