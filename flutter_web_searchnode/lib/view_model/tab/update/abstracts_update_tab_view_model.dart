import 'package:flutter/material.dart';

class UpdateCardTabViewModel with ChangeNotifier {
  // late Card _card;
  //
  bool _isExpanded = false;

  void switchExpandAuto() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

/*
  void collapseCard() {
    _isExpanded = false;
    notifyListeners();
  }

  void expandCard() {
    _isExpanded = true;
    notifyListeners();
  }
*/
  bool get isExpanded => _isExpanded;
// Card get card => _card;
}
