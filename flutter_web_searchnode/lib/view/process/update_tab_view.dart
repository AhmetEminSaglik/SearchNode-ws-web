import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/model/UpdateTabCard.dart';
import 'package:flutter_web_searchnode/product/custom_card.dart';
import 'package:flutter_web_searchnode/product/custom_circular_shape_value.dart';
import 'package:flutter_web_searchnode/product/custom_common_tab_widget.dart';
import 'package:flutter_web_searchnode/product/custom_edit_text_with_title.dart';
import 'package:flutter_web_searchnode/product/custom_location.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';
import 'package:flutter_web_searchnode/product/space_tools.dart';
import 'package:flutter_web_searchnode/tools/CustomColors.dart';
import 'package:flutter_web_searchnode/view_model/tab/update/reset_all_char_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/update/reset_char_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/update/update_chars_view_model.dart';
import 'package:flutter_web_searchnode/view_model/tab/update/update_explanation_view_model.dart';
import 'package:provider/provider.dart';

class UpdateTab extends StatefulWidget {
  @override
  State<UpdateTab> createState() => _UpdateTabState();
}

class _UpdateTabState extends State<UpdateTab> {
  late List<UpdateCardWidgetTab> customCardList = [];

  final String textUpdateExplanation = "Update Explanation";
  final String textUpdateCharacter = "Update Character";
  final String textResetCharacter = "Reset Character";

  @override
  void initState() {
    generateCustomCardItems();
    print("customCardList : size :${customCardList.length}");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
            color: CustomColors.opacityWhite,
            child: CustomTabTitle(text: "Update Process", color: Colors.green)),
        HeightSpace(15),
        CustomDivider(),
        _getCustomUpdateCard(),
        /*   _getUpdateCard(
          isExpanded: isExpandedUpdateCharCard,
          expandedWidget: _getUpdateCharListCard(),
          collapsedWidget: Text("Colapsed Card eklencek"),
        ),
        _getUpdateCard(
          isExpanded: isExpandedResetCharCard,
          expandedWidget: _getResetCharCard(),
          collapsedWidget: Text("Colapsed Card eklencek"),
        ),*/
        // _getUpdateCards(),
        // _getUpdateExplanationCard(),
        // _getUpdateCharListCard(),
        // _getResetCharCard(),
      ],
    );
  }

  bool isExpandedUpdateExplanation = false;
  bool isExpandedUpdateCharCard = false;
  bool isExpandedResetCharCard = false;

  Widget _getCustomUpdateCard() {
    // print(" isExpandedUpdateExplanation : $isExpandedUpdateExplanation");
    // print(" isExpanded : ${customCard.isExpanded}");
    return ListView.builder(
        shrinkWrap: true,
        itemCount: customCardList.length,
        itemBuilder: (context, index) {
          return CustomCard(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ExpansionTile(
              iconColor: Colors.white,
              trailing: customCardList[index].isExpanded
                  ? CustomCircularShapeIconButton(
                      iconData: Icons.keyboard_arrow_up_sharp,
                      color: CustomColors.black,
                      onPressed: () {
                        setState(() {
                          customCardList[index].collapse();
                        });
                      })
                  : CustomCircularShapeIconButton(
                      iconData: Icons.keyboard_arrow_down_sharp,
                      onPressed: () {
                        setState(() {
                          customCardList[index].expand();
                        });
                      }),
              // collapsedBackgroundColor: Colors.red,
              collapsedIconColor: Colors.white,
              // backgroundColor: Colors.lightBlue.withOpacity(0.2),
              collapsedShape:
                  Border.fromBorderSide(BorderSide(color: Colors.transparent)),
              shape:
                  Border.fromBorderSide(BorderSide(color: Colors.transparent)),
              title: customCardList[index].getCard(),
              onExpansionChanged: (bool value) {
                setState(() {
                  customCardList[index].expand();
                });
              },
            ),
          ));
        });
  }

/*

  UpdateCardTabViewModel _getUpdateCards() {
    return Consumer<UpdateCardTabViewModel>(
        builder: (context, vm, child) => ListView.builder(
              shrinkWrap: true,
              itemCount: cardList.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: cardList[index], child: cardList[index]);
              },
            ));
  }
*/
  Widget _getUpdateExplanationCard() {
    UpdateExplanationViewModel vm =
        Provider.of<UpdateExplanationViewModel>(context, listen: false);
    return Column(
      children: [
        _getCardText(text: textUpdateExplanation, textColor: Colors.white),
        InputFieldWithTitle(
            title: "Data",
            controller: vm.dataController,
            hintText: "Example : Leve Palestina"),
        InputFieldWithTitle(
            title: "Current Explanation",
            controller: vm.oldExplanationController,
            hintText: "Example : Live Palestine"),
        InputFieldWithTitle(
            title: "New Explanation",
            controller: vm.newExplanationController,
            hintText: "Example : Long live Palestine"),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomButtonLocation_BottomRight(CustomElevatedButton(
              text: "Update",
              function: () {
                vm.update();
              })),
        ),
        _getResultMsgUpdateExplanation(),
      ],
    );
  }

  Widget _getUpdateCharListCard() {
    UpdateCharsViewModel vm =
        Provider.of<UpdateCharsViewModel>(context, listen: false);
    return Column(
      children: [
        _getCardText(text: textUpdateCharacter, textColor: Colors.white),
        InputFieldWithTitle(
            // title: "Character to put next ",
            title: "Referance Char ",
            controller: vm.charToNextController,
            hintText: "Example : a",
            maxLength: 1),
        InputFieldWithTitle(
            title: "Character list to update",
            controller: vm.charListController,
            hintText: "Example : abcd"),
        CustomButtonLocation_BottomRight(CustomElevatedButton(
            text: "Update",
            function: () {
              vm.update();
            })),
        _getResultMsgUpdateChar(),
      ],
    );
  }

  Widget _getResetCharCard() {
    ResetCharViewModel vm =
        Provider.of<ResetCharViewModel>(context, listen: false);
    return Column(
      children: [
        _getCardText(text: textResetCharacter, textColor: Colors.white),
        InputFieldWithTitle(
            title: "Character list",
            controller: vm.charListController,
            hintText: "Example : Zionism"),
        CustomButtonLocation_BottomRight(CustomElevatedButton(
            text: "Reset",
            function: () {
              vm.resetCharacters();
            })),
        CustomButtonLocation_BottomRight(CustomElevatedButton(
            text: "Reset All Characters",
            function: () {
              ResetAllCharViewModel vm =
                  Provider.of<ResetAllCharViewModel>(context, listen: false);
              vm.resetAllCharacters();
            })),
        _getResultMsgResetChar(),
      ],
    );
  }

  Text _getCardText(
      {required String text,
      Color textColor = Colors.black,
      bool isBold = false}) {
    return Text(text,
        style: TextStyle(
            fontSize: 22,
            color: textColor,
            fontWeight: isBold ? FontWeight.bold : null));
  }

  generateCustomCardItems() {
    UpdateCardWidgetTab expandedUpdateExplanationCard = UpdateCardWidgetTab(
        expandedCard: _getUpdateExplanationCard(),
        collapsedCard:
            _getCardText(text: textUpdateExplanation, textColor: Colors.white));

    UpdateCardWidgetTab expandedUpdateCharacterCard = UpdateCardWidgetTab(
        expandedCard: _getUpdateCharListCard(),
        collapsedCard:
            _getCardText(text: textUpdateCharacter, textColor: Colors.white));

    UpdateCardWidgetTab expandedResetCharacterCard = UpdateCardWidgetTab(
        expandedCard: _getResetCharCard(),
        collapsedCard:
            _getCardText(text: textResetCharacter, textColor: Colors.white));

    customCardList.add(expandedUpdateExplanationCard);
    customCardList.add(expandedUpdateCharacterCard);
    customCardList.add(expandedResetCharacterCard);
  }

  Widget _getResultMsgUpdateExplanation() {
    return Consumer<UpdateExplanationViewModel>(
      builder: (context, vm, child) {
        if (vm.msg.isNotEmpty && vm.isSuccess != null) {
          return Card(
            color: CustomMsgContainerBackgroundStyle(vm.isSuccess),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                vm.msg,
                style: CustomTextStyleForResultMsg(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _getResultMsgUpdateChar() {
    return Consumer<UpdateCharsViewModel>(
      builder: (context, vm, child) {
        if (vm.msg.isNotEmpty && vm.isSuccess != null) {
          return Card(
            color: CustomMsgContainerBackgroundStyle(vm.isSuccess),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                vm.msg,
                style: CustomTextStyleForResultMsg(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _getResultMsgResetChar() {
    return Consumer<ResetCharViewModel>(
      builder: (context, vm, child) {
        if (vm.msg.isNotEmpty && vm.isSuccess != null) {
          return Card(
            color: CustomMsgContainerBackgroundStyle(vm.isSuccess),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                vm.msg,
                style: CustomTextStyleForResultMsg(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
