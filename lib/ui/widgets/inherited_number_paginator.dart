import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

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
  bool updateShouldNotify(InheritedNumberPaginator oldWidget) => true;
}
