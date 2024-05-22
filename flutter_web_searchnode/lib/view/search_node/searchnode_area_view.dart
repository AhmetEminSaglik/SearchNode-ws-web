import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/model/data_info_dto.dart';
import 'package:flutter_web_searchnode/model/node_data_dto.dart';
import 'package:flutter_web_searchnode/product/custom_circular_shape_value.dart';
import 'package:flutter_web_searchnode/product/space_tools.dart';
import 'package:flutter_web_searchnode/tools/CustomColors.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
import 'package:provider/provider.dart';

class SearchNodeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _getSearchNodeDataList(),
      ],
    );
  }

  Widget _getSearchNodeDataList() {
    return Consumer<SearchNodeAreaViewModel>(
        builder: (context, viewModel, child) => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: viewModel.searchNode?.nodeDataDTOList?.length ?? 0,
            // if this is null, it works forever
            itemBuilder: (context, index) {
              return viewModel.searchNode?.nodeDataDTOList?.length == 0
                  ? Text("Empty")
                  : ChangeNotifierProvider.value(
                      value: viewModel.searchNode?.nodeDataDTOList?[index],
                      child: _buildListItem(context, index),
                    );
            }));
  }

  Widget _buildListItem(BuildContext context, int index) {
    SearchNodeAreaViewModel viewModel =
        Provider.of<SearchNodeAreaViewModel>(context, listen: false);
    bool isCollapsed = true;
    return Consumer<NodeDataDTO?>(
      builder: (context, nodeDataDTO, child) => Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Card(
          color: CustomColors.CBOWhite,
          // color: CustomColors.white,
          child: _getExpansionTile(isCollapsed, viewModel, index),
        ),
      ),
    );
  }

  Widget _getExpansionTile(
      bool isCollapsed, SearchNodeAreaViewModel viewModel, int index) {
    NodeDataDTO nodeData = viewModel.searchNode!.nodeDataDTOList![index];
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: ExpansionTile(
          onExpansionChanged: (bool) {
            isCollapsed = bool;
          },
          // backgroundColor: CustomColors.lightGreen,
          backgroundColor: CustomColors.CBOLightGreen,
          shape: Border.fromBorderSide(BorderSide(color: Colors.transparent)),
          collapsedShape:
              Border.fromBorderSide(BorderSide(color: Colors.transparent)),
          title: _ExpansionInnerPadding(
            child: Row(
              children: [
                _getSubItemTextKey(text: "Value : "),
                _getSubItemTextKey(text: nodeData.locationAddress ?? "no-data"),
              ],
            ),
          ),
          subtitle: _ExpansionInnerPadding(
            child: Column(
              children: [
                Row(
                  children: [
                    _getSubItemTextValue(text: "Deep : "),
                    _getSubItemTextValue(text: "${nodeData.deep}"),
                  ],
                ),
                Row(
                  children: [
                    _getSubItemTextValue(text: "NDTVN : "),
                    _getSubItemTextValue(
                        text: "${nodeData.nextDirectionsTotalValueNumber}"),
                  ],
                ),
                Row(
                  children: [
                    _getSubItemTextValue(text: "Data Size : "),
                    _getSubItemTextValue(
                        text: "${nodeData.listDataInfoDTO!.length}"),
                  ],
                ),
                HeightSpace(),
              ],
            ),
          ),
          leading: _getSubItemTextKey(text: "${index + 1}-) "),
          //_getCircularShapeIntValue(index + 1, Colors.blue),
          trailing: CustomCircularShapeIntValue(
              value: nodeData.listDataInfoDTO!.length, color: CustomColors.white,backgroundColor: CustomColors.black ),
          // leading: _getCircularShapeIntValue(index + 1),
          // trailing: _getCircularShapeIntValue(nodeData.listDataInfoDTO!.length),
          children: viewModel
              .searchNode!.nodeDataDTOList![index].listDataInfoDTO!
              .map((dataInfo) => _getListTile(dataInfo))
              .toList()),
    );
  }

  ListTile _getListTile(DataInfoDTO dataInfo) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDivider(),
            /*Row(
              children: [
                _getSubItemTextKey(
                    text: _getDataInfoNo(dataInfo), color: Colors.white),
                _getSubItemTextValue(
                    text: "Total Added :${dataInfo.totalSameNum!}")
              ],
            ),*/
            Center(
                child: CustomCircularShapeIntValue(
                    value: _getDataInfoNo(dataInfo),
                    color: Colors.white,
                    backgroundColor: Colors.black)),
            Row(
              children: [
                _getSubItemTextKey(text: "Index : "),
                _getSubItemTextValue(text: "${dataInfo.index!}")
              ],
            ),
            Row(
              children: [
                _getSubItemTextKey(text: "Total Added : "),
                _getSubItemTextValue(text: "${dataInfo.totalSameNum!}")
              ],
            ),
            HeightSpace(),
            Row(
              children: [
                _getSubItemTextKey(text: "Explanation : "),
                _getSubItemTextValue(text: dataInfo.explanation!),
              ],
            ),
            HeightSpace()
          ],
        ),
      ),
      // : Text("explanation :${dataInfo.explanation!}"),
    );
  }

  Widget _ExpansionInnerPadding({required Widget child}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: child,
      ),
    );
  }

  int _getDataInfoNo(DataInfoDTO dataInfo) => (dataInfo.index! + 1);

  Widget _getSubItemTextKey(
      {required String text, Color color = Colors.black}) {
    return _getSubItemText(text: text, color: color, isBold: true);
  }

  Widget _getSubItemTextValue({required String text}) {
    return _getSubItemText(text: text);
  }

  Widget _getSubItemText(
      {required String text, Color color = Colors.black, bool isBold = false}) {
    return Text(text,
        style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: isBold ? FontWeight.bold : null));
  }
}
