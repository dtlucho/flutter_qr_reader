import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOption = 1;

  int get selectedMenuOption => _selectedMenuOption;

  set selectedMenuOption(int index) {
    _selectedMenuOption = index;
    notifyListeners();
  }
}
