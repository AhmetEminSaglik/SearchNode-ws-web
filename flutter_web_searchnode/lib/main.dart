import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/view/home_page_view.dart';
import 'package:flutter_web_searchnode/view_model/result_view_model.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/delete_tab_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/save_tab_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

//Consumer'da data aliniyor,
// providerda fonksiyonlar calistiriliyor.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => SearchNodeAreaViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ResultViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => SaveTabViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => DeleteTabViewModel(),)
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
