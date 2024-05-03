import 'package:flutter/material.dart';

class ProcessArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
            toolbarHeight: 0,
            leading: null,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              // indicatorColor: Colors.red,
              labelColor: Colors.red,
              overlayColor:
                  MaterialStateColor.resolveWith((states) => Colors.pinkAccent),
              tabs: [
                Tab(
                  child: _getTabBarText("Save", Icons.save),
                ),
                Tab(
                  child: _getTabBarText("Update", Icons.update),
                ),
                Tab(
                  child: _getTabBarText("Delete", Icons.delete),
                ),
              ],
            )),
        body: TabBarView(
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );

    /*
    return ListView(
      shrinkWrap: true,
      children: [

      ],
    );
  */
  }

  Widget _getTabBarText(String text, IconData iconData) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: text, style: TextStyle(color: Colors.black, fontSize: 25)),
      WidgetSpan(
        child: SizedBox(
          width: 25,
        ),
      ),
      WidgetSpan(
          child: Icon(
        iconData,
        color: Colors.black,
        size: 35,
      )),
    ]));
    /* return Text(
      text,
      style: TextStyle(fontSize: 35),
    );*/
  }
}
