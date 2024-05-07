import 'package:flutter/material.dart';
import 'package:flutter_web_searchnode/model/UpdateTabCard.dart';
import 'package:flutter_web_searchnode/product/custom_common_tab_widget.dart';
import 'package:flutter_web_searchnode/product/custom_edittext_with_title.dart';
import 'package:flutter_web_searchnode/product/custom_location.dart';
import 'package:flutter_web_searchnode/product/custom_text_style.dart';

class UpdateTab extends StatefulWidget {
  @override
  State<UpdateTab> createState() => _UpdateTabState();
}

class _UpdateTabState extends State<UpdateTab> {
  late List<UpdateCardTab> customCardList = [];

  @override
  void initState() {
    customCardList = generateCustomCardItems();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CustomTabTitle(text: "Update Process", color: Colors.green),
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
          return InkWell(
            onTap: () {
              setState(() {
                customCardList[index].switchExpandValue();
              });
            },
            child: customCardList[index].getCard(),
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
  Card _getUpdateExplanationCard() {
    return Card(
      child: Column(
        children: [
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
      ),
    );
  }

  Widget _getUpdateCharCard() {
    return Card(
      child: Column(
        children: [
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
      ),
    );
  }

  Widget _getResetCharCard() {
    return Card(
      child: Column(
        children: [
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
      ),
    );
  }

  Card _getCollapsedCard(String text) {
    return Card(
      child: Text(text),
    );
  }

  List<UpdateCardTab> generateCustomCardItems() {
    List<UpdateCardTab> list = [];
    UpdateCardTab expandedUpdateExplanationCard = UpdateCardTab(
        expandedCard: _getUpdateExplanationCard(),
        collapsedCard: _getCollapsedCard("Update Explanation"));

    UpdateCardTab expandedUpdateCharacterCard = UpdateCardTab(
        expandedCard: _getUpdateExplanationCard(),
        collapsedCard: _getCollapsedCard("Update Character"));

    UpdateCardTab expandedResetCharacterCard = UpdateCardTab(
        expandedCard: _getUpdateExplanationCard(),
        collapsedCard: _getCollapsedCard("Reset Character"));

    list.add(expandedUpdateExplanationCard);
    list.add(expandedUpdateCharacterCard);
    list.add(expandedResetCharacterCard);
    return list;
  }
}
