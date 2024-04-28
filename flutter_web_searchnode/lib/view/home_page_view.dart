import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/view/SearchNodeArea.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SearchNodeAreaViewModel searchNodeAreaViewModel =
    //     new SearchNodeAreaViewModel();
    return Scaffold(
      appBar: _buildAppBar(),
      // body: _buildBody(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Expanded(child: _getSearchNodeArea()),
        Expanded(child: SearchNodeArea()/*_getSearchNodeArea(context)*/),
        VerticalDivider(),
        Expanded(
            child: ListView(children: [
              _buildTitleOfDividedArea(
                  title: "PROCESS", color: Colors.lightBlue),
              Container(color: Colors.red, child: Center(child: Text("Ahmet"))),
            ])),
        VerticalDivider(),
        Expanded(
            child: ListView(children: [
              _buildTitleOfDividedArea(title: "RESULT", color: Colors.orange),
              Container(
                  color: Colors.yellow, child: Center(child: Text("Ahmet"))),
              Container(
                  color: Colors.blue, child: Center(child: Text("Ahmet"))),
              Container(
                  color: Colors.greenAccent,
                  child: Center(child: Text("Ahmet"))),
            ])),
      ],
    );
  }



  AppBar _buildAppBar() {
    return AppBar(
      title: null, //Text("SearchNode Project"),
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
