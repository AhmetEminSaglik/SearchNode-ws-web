import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/view/home_page_view.dart';
import 'package:flutter_web_searchnode/view_model/result_view_model.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/card_tab_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/delete_tab_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/save_tab_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/update/reset_all_char_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/update/reset_char_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/update/update_chars_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/update/update_explanation_view_model.dart';
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
              create: (BuildContext context) => DeleteTabViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => UpdateCardTabViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => UpdateExplanationViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => UpdateCharsViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ResetCharViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ResetAllCharViewModel()),
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
