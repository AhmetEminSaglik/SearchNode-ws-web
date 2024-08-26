import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/custom_circular_shape_value.dart';
import 'package:flutter_web_searchnode/tools/CustomColors.dart';
import 'package:flutter_web_searchnode/tools/SingletonBuildContext.dart';
import 'package:flutter_web_searchnode/tools/locator.dart';
import 'package:flutter_web_searchnode/view/process/process_area_view.dart';
import 'package:flutter_web_searchnode/view/result/result_area_view.dart';
import 'package:flutter_web_searchnode/view/search_node/searchnode_area_view.dart';
import 'package:flutter_web_searchnode/view_model/result_view_model.dart';
import 'package:flutter_web_searchnode/view_model/searchnode_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static bool initialized = false;

  _initializeBuildContextLocator(BuildContext context) {
    if (!initialized) {
      locator.registerSingleton<SingletonBuildContext>(
          SingletonBuildContext(context: context));
      initialized = true;
    }
  }

  bool _isVisible = false;

  initAnimation() async {
    if (_isVisible == false) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _isVisible = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    _initializeBuildContextLocator(context);
    return Scaffold(
      // appBar: _buildAppBar(),
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
              )),
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // LayoutBuilder(
          //   builder: (context, constraints) {
          //     return Center(
          //       child: Container(
          //         height: constraints.maxHeight,
          //         // Adjust the multiplier as needed
          //         width: constraints.maxWidth,
          //         // Adjust the multiplier as needed
          //         child: CustomPaint(
          //           painter: TrianglePainter(),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0,
            duration: Duration(milliseconds: 1000),
            child: Center(
              child: _buildBody(context),
            ),
          ),
        ],
      ),
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
                  widget: _getSearchNodeListLengthInCircularWidget(context),
                  color: CustomColors.backgroudnLightBlack),
              Expanded(child: SearchNodeArea()),
            ],
          ),
        ),
        VerticalDivider(),
        Expanded(
            child: Column(children: [
          _buildTitleOfDividedArea(
              title: "PROCESS", color: CustomColors.backgroudnLightBlack),
          Expanded(child: ProcessArea()),
        ])),
        VerticalDivider(),
        Expanded(
            child: Column(children: [
          _buildTitleOfDividedArea(
              title: "RESULT",
              widget: _getLogsLengthInCircularWidget(context),
              color: CustomColors.backgroudnLightBlack),
          Expanded(child: ResultArea()),
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
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: isWidgetNull
          //     ? MainAxisAlignment.center

          // : MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            isWidgetNull == false
                ? Row(
                    children: [SizedBox(width: 25), widget!],
                  )
                : Container(),
          ],
        )));
  }

  _getSearchNodeListLengthInCircularWidget(BuildContext context) {
    return Consumer<SearchNodeAreaViewModel>(
      builder: (context, vm, child) {
        return CustomCircularShapeIntValue(value: vm.getNodeDataListSize());
      },
    );
  }

  _getLogsLengthInCircularWidget(BuildContext context) {
    return Consumer<ResultViewModel>(
      builder: (context, vm, child) {
        return CustomCircularShapeIntValue(value: vm.logs.length);
      },
    );
  }
}
