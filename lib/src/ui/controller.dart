import 'package:flutter/material.dart';

class NumberPaginatorController extends ValueNotifier<int> {
  NumberPaginatorController() : super(0);

  int get currentPage => value;

  set currentPage(int value) => super.value = value;

  /// Decreases page by 1 and notifies listeners
  void prev() => currentPage--;

  /// Increases page by 1 and notifies listeners
  void next() => currentPage++;

  /// Alias for setter
  void navigateToPage(int index) => currentPage = index;
}
