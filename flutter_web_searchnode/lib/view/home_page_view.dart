import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_searchnode/view/SearchNodeArea.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SearchNodeAreaViewModel searchNodeAreaViewModel =
    //     new SearchNodeAreaViewModel();
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      // body: _buildBody3(context),
    );
  }

  /*
  * //1-) SingleChildScrollView ( column( Listview ( shrinkWrap:true
    //2-) ListView( Column)
    //3-) Row ( expanded ( listview( ...))))
    * */

  Widget _buildBody3(BuildContext context) {
    //1-) SingleChildScrollView ( column( Listview ( shrinkWrap:true
    //2-) ListView( Column)
    //3-) Row ( expanded ( listview( ...))))
    return Row(
      children: [
        Expanded(
          child: ListView(
            // scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            // physics: ClampingScrollPhysics(),
            children: [
              _buildTitleOfDividedArea(
                  title: "SEARCH NODE ", color: Colors.lightBlue),
              _buildTitleOfDividedArea(
                  title: "SEARCH NODE ", color: Colors.lightBlue),
              _buildTitleOfDividedArea(
                  title: "SEARCH NODE ", color: Colors.lightBlue),
              SearchNodeArea(),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Expanded(child: _getSearchNodeArea()),
        Expanded(
          child: ListView(
            children: [
              _buildTitleOfDividedArea(
                  title: "SEARCH NODE ", color: Colors.lightBlue),
              SearchNodeArea(),
            ],
          ),
        ),
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

  Widget _buildBody2(BuildContext context) {
    return ListView(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            _buildTitleOfDividedArea(
                title: "SEARCH NODE ", color: Colors.lightBlue),
            SearchNodeArea(),
          ],
        ),
      ],
    );
  }


}
