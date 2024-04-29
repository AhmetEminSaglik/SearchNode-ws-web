import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/model/node_data_dto.dart';
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
            } //_getItemBuilder
            ));
  }

  _buildListItem(BuildContext context, int index) {
    SearchNodeAreaViewModel viewModel =
        Provider.of<SearchNodeAreaViewModel>(context, listen: false);
    return Consumer<NodeDataDTO?>(
      builder: (context, nodeDataDTO, child) => ListTile(
        title: Text(
            viewModel.searchNode?.nodeDataDTOList?[index].locationAddress ??
                "no-data"),
      ),
    );
  }
}
