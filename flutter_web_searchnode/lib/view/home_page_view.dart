import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/CircularShapeValue.dart';
import 'package:flutter_web_searchnode/view/process/ProcessArea.dart';
import 'package:flutter_web_searchnode/view/search_node/SearchNodeArea.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: null, //Text("SearchNode Project"),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTitleOfDividedArea(
                  title: "SEARCH NODE",
                  widget: _getCircularValueData(context),
                  color: Colors.lightBlue),
              Expanded(child: SearchNodeArea()),
            ],
          ),
        ),
        VerticalDivider(),
        Expanded(
            child: Column(children: [
          _buildTitleOfDividedArea(title: "PROCESS", color: Colors.lightBlue),
          Expanded(child: ProcessArea()),
        ])),
        VerticalDivider(),
        Expanded(
            child: ListView(children: [
          _buildTitleOfDividedArea(title: "RESULT", color: Colors.orange),
          Container(color: Colors.yellow, child: Center(child: Text("Ahmet"))),
          Container(color: Colors.blue, child: Center(child: Text("Ahmet"))),
          Container(
              color: Colors.greenAccent, child: Center(child: Text("Ahmet"))),
        ])),
      ],
    );
  }

  Widget _buildTitleOfDividedArea(
      {required String title, required Color color, Widget? widget}) {
    bool isWidgetNull;
    widget == null ? isWidgetNull = true : isWidgetNull = false;
    return Card(
        color: color,
        child: Center(
            child: Row(
          mainAxisAlignment: isWidgetNull
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            isWidgetNull ? Container() : widget!,
          ],
        )));
  }

  _getCircularValueData(BuildContext context) {
    print('AAAAAAAAAAAAAAAA');
    // SearchNodeAreaViewModel viewModel= Provider.of<SearchNodeAreaViewModel>(context,listen:  false);
    return Consumer<SearchNodeAreaViewModel>(
      builder: (context, vm, child) {
        return CustomCircularShapeIntValue(value: vm.getNodeDataListSize());
      },
    );
  }
}
