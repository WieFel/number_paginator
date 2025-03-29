import 'package:flutter/material.dart';

class NumberPaginatorController extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  /// Decreases page by 1 and notifies listeners
  void prev() => currentPage--;

  /// Increases page by 1 and notifies listeners
  void next() => currentPage++;

  /// Alias for setter
  void navigateToPage(int index) => currentPage = index;
}
