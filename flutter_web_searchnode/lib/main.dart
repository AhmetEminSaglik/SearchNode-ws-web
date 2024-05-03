import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/view/home_page_view.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
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
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
