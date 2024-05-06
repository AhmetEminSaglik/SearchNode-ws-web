import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_searchnode/product/custom_location.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';
import 'package:flutter_web_searchnode/product/space_tools.dart';
import 'package:flutter_web_searchnode/view_model/result_view_model.dart';
import 'package:provider/provider.dart';

class ResultArea extends StatelessWidget {
  const ResultArea({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        HeightSpace(),
        _getClearLogBtn(context),
        ListView(
          shrinkWrap: true,
          children: [
            _getLogs(),
            // Text("aaa"),
          ],
        ),
      ],
    );
  }

  Widget _getClearLogBtn(BuildContext context) {
    return Column(
      children: [
        CustomButtonLocation_BottomCenter(
          Center(
            child: CustomElevatedButton(
                text: "Clear Logs",
                function: () {
                  _clearLog(context);
                }),
          ),
        ),
        /*
        Center(
          child: CustomElevatedButton(
              text: "Clear Logs",
              function: () {
                _clearLog(context);
              }),
        ),*/

        HeightSpace(7),
        Provider.of<ResultViewModel>(context).logs.isNotEmpty
            ? CustomDivider()
            : Container(),
      ],
    );
  }

  Consumer<ResultViewModel> _getLogs() {
    return Consumer<ResultViewModel>(
      builder: (context, vm, child) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: vm.logs.length,
            // I forgot to add itemCount. Memory in Linux was directly reach to  99%. Laptop(Linux) almost died.
            itemBuilder: (context, index) {
              /*   return Card(
                child: Text(vm.logs[index]),
              );*/
              // return  _getLogItem(vm, index);
              return _getLogItem(vm, index);
            });
      },
    );
  }

  Widget _getLogItem(ResultViewModel vm, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(vm.logs[index]),
        HeightSpace(),
        CustomDivider(),
      ],
    );
  }

/*Widget _getLogs() {
    Column(children: [],)
  }*/

  _clearLog(BuildContext context) {
    Provider.of<ResultViewModel>(context, listen: false).clearLogs();
  }
}
