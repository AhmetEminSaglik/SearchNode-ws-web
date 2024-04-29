import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/view/ProcessArea.dart';
import 'package:flutter_web_searchnode/view/SearchNodeArea.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: null, //Text("SearchNode Project"),
    );
  }

  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTitleOfDividedArea(
                  title: "SEARCH NODE ", color: Colors.lightBlue),
              Expanded(child: SearchNodeArea()),
            ],
          ),
        ),
        VerticalDivider(),
        Expanded(
            child: ListView(children: [
          _buildTitleOfDividedArea(title: "PROCESS", color: Colors.lightBlue),
              ProcessArea(),
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
      {required String title, required Color color}) {
    return Card(
        color: color,
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )));
  }
}
