import 'package:flutter/material.dart';

class UIStateViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void switchTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}