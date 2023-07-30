import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

/// [InheritedWidget] for providing information for the children of
/// [NumberPaginator].
class InheritedNumberPaginator extends InheritedWidget {
  /// Total number of pages that should be shown.
  final int numberPages;

  /// Index of initially selected page.
  final int initialPage;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  /// The UI config for the [NumberPaginator].
  final NumberPaginatorUIConfig config;

  const InheritedNumberPaginator({
    Key? key,
    required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    required this.config,
    required Widget child,
  }) : super(key: key, child: child);

  static InheritedNumberPaginator of(BuildContext context) {
    final InheritedNumberPaginator? result =
        context.dependOnInheritedWidgetOfExactType<InheritedNumberPaginator>();
    assert(result != null, "No NumberPaginatorConfig found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedNumberPaginator oldWidget) => true;
}
