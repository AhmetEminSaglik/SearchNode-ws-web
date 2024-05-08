import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/model/UpdateTabCard.dart';
import 'package:flutter_web_searchnode/product/custom_common_tab_widget.dart';
import 'package:flutter_web_searchnode/product/custom_edittext_with_title.dart';
import 'package:flutter_web_searchnode/product/custom_location.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';
import 'package:flutter_web_searchnode/product/space_tools.dart';

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
        CustomTabTitle(text: "Update Process", color: Colors.green),
        HeightSpace(15),
        CustomDivider(),
        _getCustomUpdateCard(),
        /*   _getUpdateCard(
          isExpanded: isExpandedUpdateCharCard,
          expandedWidget: _getUpdateCharCard(),
          collapsedWidget: Text("Colapsed Card eklencek"),
        ),
        _getUpdateCard(
          isExpanded: isExpandedResetCharCard,
          expandedWidget: _getResetCharCard(),
          collapsedWidget: Text("Colapsed Card eklencek"),
        ),*/
        // _getUpdateCards(),
        // _getUpdateExplanationCard(),
        // _getUpdateCharCard(),
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
          return Card(
            color: Colors.lightBlueAccent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ExpansionTile(
                // iconColor: Colors.white,
                // collapsedBackgroundColor: Colors.red,
                // collapsedIconColor: Colors.white,
                backgroundColor: Colors.white70,
                collapsedShape: Border.fromBorderSide(
                    BorderSide(color: Colors.transparent)),
                shape: Border.fromBorderSide(
                    BorderSide(color: Colors.transparent)),
                title: customCardList[index].getCard(),
                onExpansionChanged: (bool value) {
                  setState(() {
                    customCardList[index].switchExpandValue();
                  });
                },
              ),
            ),
          );
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
    return Column(
      children: [
        _getCardText(text: textUpdateExplanation, textColor: Colors.blue,isBold: true),
        InputFieldWithTitle(
            title: "Data",
            controller: TextEditingController(),
            hintText: "Type data of explanation to update"),
        InputFieldWithTitle(
            title: "Current Explanation",
            controller: TextEditingController(),
            hintText: "Type current explanation will be updated"),
        InputFieldWithTitle(
            title: "New Explanation",
            controller: TextEditingController(),
            hintText: "Type new explanation"),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomButtonLocation_BottomCenter(CustomElevatedButton(
              text: "Update Explanation",
              function: () {
                print("update islemi yapilacak");
              })),
        )
      ],
    );
  }

  Widget _getUpdateCharCard() {
    return Column(
      children: [
        _getCardText(text: textUpdateCharacter, textColor: Colors.blue,isBold: true),
        InputFieldWithTitle(
            title: "Character to put next ",
            controller: TextEditingController(),
            hintText: "Type data of explanation to update"),

        InputFieldWithTitle(
            title: "Character list to update",
            controller: TextEditingController(),
            hintText: "Type data of explanation to update"),
        CustomButtonLocation_BottomRight(CustomElevatedButton(
            text: "Update",
            function: () {
              print("update islemi yapilacak");
            }))
      ],
    );
  }

  Widget _getResetCharCard() {
    return Column(
      children: [
        _getCardText(text: textResetCharacter, textColor: Colors.blue,isBold: true),
        InputFieldWithTitle(
            title: "Character list",
            controller: TextEditingController(),
            hintText: "Type characters to reset : abcd"),
        CustomButtonLocation_BottomRight(CustomElevatedButton(
            text: "Reset Chars",
            function: () {
              print("update islemi yapilacak");
            })),
        CustomButtonLocation_BottomRight(CustomElevatedButton(
            text: "Reset All Characters",
            function: () {
              print("Reset All Characters");
            })),
      ],
    );
  }

  Text _getCardText(
      {required String text, Color textColor=Colors.black, bool isBold = false}) {
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
        expandedCard: _getUpdateCharCard(),
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
}
