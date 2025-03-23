import 'package:flutter/material.dart';

import '../controller.dart';

/// [InheritedWidget] for providing information for the children of
/// [NumberPaginator].
class InheritedNumberPaginator extends InheritedWidget {
  /// Total number of pages that should be shown.
  final int numberPages;

  /// Index of initially selected page.
  final int initialPage;

  /// The number paginator controller
  final NumberPaginatorController controller;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  const InheritedNumberPaginator({
    super.key,
    required this.numberPages,
    required this.controller,
    this.initialPage = 0,
    this.onPageChange,
    required super.child,
  });

  static InheritedNumberPaginator of(BuildContext context) {
    final InheritedNumberPaginator? result =
        context.dependOnInheritedWidgetOfExactType<InheritedNumberPaginator>();
    assert(result != null, "No NumberPaginatorConfig found in context");
    return result!;
  }

  @override
  // TODO: optimization -> don't just return true always
  bool updateShouldNotify(InheritedNumberPaginator oldWidget) => true;

  /// Whether it is currently allowed to navigate to the previous page
  bool get isPrevAllowed => controller.currentPage > 0;

  /// Whether it is currently allowed to navigate to the next page
  bool get isNextAllowed => controller.currentPage < numberPages - 1;

  /// Alias for `controller.currentPage`
  int get currentPage => controller.currentPage;
}
