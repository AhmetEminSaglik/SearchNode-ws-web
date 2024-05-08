import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/view/process/delete_tab_view.dart';
import 'package:flutter_web_searchnode/view/process/save_tab_view.dart';
import 'package:flutter_web_searchnode/view/process/update_tab_view.dart';

class ProcessArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: Colors.greenAccent,
        appBar: AppBar(
            toolbarHeight: 0,
            leading: null,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              // indicatorColor: Colors.red,
              // labelColor: Colors.red,
/*              overlayColor:
                  MaterialStateColor.resolveWith((states) => Colors.grey),*/
              dividerColor: Colors.black,
              tabs: [
                // Tab(child: _getTabBarText("Save", Icons.add, Colors.blue)),
                // Tab(child: _getTabBarText("Update", Icons.edit, Colors.green)),
                // Tab(child: _getTabBarText("Delete", Icons.delete, Colors.red)),
                Tab(child: _getTabBarText("", Icons.edit, Colors.green)),
                Tab(child: _getTabBarText("", Icons.add, Colors.blue)),
                Tab(child: _getTabBarText("", Icons.delete, Colors.red)),
              ],
            )),
        body: TabBarView(
          children: [
            UpdateTab(),
            SaveTab(),
            DeleteTab(),
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

  Widget _getTabBarText(String text, IconData iconData,
      [Color color = Colors.black]) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: text, style: TextStyle(color: color, fontSize: 20)),
      const WidgetSpan(child: SizedBox(width: 5)),
      WidgetSpan(child: Icon(iconData, color: color, size: 25)),
    ]));
    /* return Text(
      text,
      style: TextStyle(fontSize: 35),
    );*/
  }
}
