import 'package:flutter/material.dart';

class NumberPaginatorController extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  /// Decreases page by 1 and notifies listeners
  prev() {
    _currentPage--;
    notifyListeners();
  }

  /// Increases page by 1 and notifies listeners
  next() {
    _currentPage++;
    notifyListeners();
  }

  /// Alias for setter
  navigateToPage(int index) {
    currentPage = index;
  }
}
