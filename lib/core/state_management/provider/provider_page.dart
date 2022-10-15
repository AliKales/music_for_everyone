import 'package:flutter/material.dart';

class ProviderPage with ChangeNotifier {
  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;

    notifyListeners();
  }
}
