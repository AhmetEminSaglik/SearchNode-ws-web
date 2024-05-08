import 'package:flutter/material.dart';

class UpdateCardWidgetTab {
  late Widget _collapsedCard;
  late Widget _expandedCard;
  bool _isExpanded = false;

  UpdateCardWidgetTab({required collapsedCard, required expandedCard}) {
    _collapsedCard = collapsedCard;
    _expandedCard = expandedCard;
  }

  Widget getCard() {
    // print("donecek deger $_isExpanded ");
    return _isExpanded ? _expandedCard : _collapsedCard;
  }

  void switchExpandValue() {
    _isExpanded = !_isExpanded;
  }

  bool get isExpanded => _isExpanded;
}
