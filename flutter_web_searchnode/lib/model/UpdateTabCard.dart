import 'package:flutter/material.dart';

class UpdateCardTab {
  late Card _collapsedCard;
  late Card _expandedCard;
  bool _isExpanded = false;

  UpdateCardTab({required collapsedCard, required expandedCard}) {
    _collapsedCard = collapsedCard;
    _expandedCard = expandedCard;
  }

  Card getCard() {
    print("donecek deger $_isExpanded ");
    return _isExpanded ? _expandedCard : _collapsedCard;
  }

  void switchExpandValue() {
    _isExpanded = !_isExpanded;
  }

  bool get isExpanded => _isExpanded;
}
