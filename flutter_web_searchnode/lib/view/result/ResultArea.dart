import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/product/CustomTextStyle.dart';
import 'package:flutter_web_searchnode/product/SpaceTools.dart';
import 'package:flutter_web_searchnode/view_model/result_view_model.dart';
import 'package:provider/provider.dart';

class ResultArea extends StatelessWidget {
  const ResultArea({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CustomElevatedButton(
            text: "Clear Logs",
            function: () {
              _clearLog(context);
            }),
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
