import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/view_model/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // void getData() async {
  //   await SearchNodeHttpRequest.requestTest();
  // }

  @override
  Widget build(BuildContext context) {
    // getData();
    SearchNodeAreaViewModel snvm= new SearchNodeAreaViewModel();
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Column(children: [
          _buildTitleOfDividedArea(title: "SEARCHNODE", color: Colors.red),
          // Container(color: Colors.red, child: Center(child: Text("SearchNode"))),
        ])),
        VerticalDivider(),
        Expanded(
            child: ListView(children: [
          _buildTitleOfDividedArea(title: "PROCESS", color: Colors.lightBlue),
          Container(color: Colors.red, child: Center(child: Text("Ahmet"))),
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
