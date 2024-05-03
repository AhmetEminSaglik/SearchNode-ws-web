import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/model/data_info_dto.dart';

class NodeDataDTO with ChangeNotifier {
  int? deep;
  int? nextDirectionsTotalValueNumber;
  String? locationAddress;
  List<DataInfoDTO>? listDataInfoDTO;

  NodeDataDTO(
      {this.deep,
      this.nextDirectionsTotalValueNumber,
      this.locationAddress,
      this.listDataInfoDTO});

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
