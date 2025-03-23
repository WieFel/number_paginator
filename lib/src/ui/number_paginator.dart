import 'package:flutter/material.dart';

import 'number_paginator_controller.dart';
import 'widgets/widgets.dart';

/// The main widget used for creating a [NumberPaginator].
class NumberPaginator extends StatefulWidget {
  /// Total number of pages that should be shown.
  final int numberPages;

  /// Index of initially selected page.
  final int initialPage;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  /// The controller for the paginator. Can be used to control the paginator from the outside.
  /// If not provided, a new controller is created.
  final NumberPaginatorController? controller;

  final Widget child;

  /// Creates an instance of [NumberPaginator].
  const NumberPaginator({
    super.key,
    required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    this.controller,
    this.child = const SizedBox(),
  })  : assert(initialPage >= 0),
        assert(initialPage <= numberPages - 1);

  @override
  NumberPaginatorState createState() => NumberPaginatorState();
}

class NumberPaginatorState extends State<NumberPaginator> {
  late NumberPaginatorController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? NumberPaginatorController();
    _controller.currentPage = widget.initialPage;
    _controller.addListener(() {
      widget.onPageChange?.call(_controller.currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedNumberPaginator(
      numberPages: widget.numberPages,
      controller: _controller,
      initialPage: widget.initialPage,
      onPageChange: _controller.navigateToPage,
      child: widget.child,
      // Row(
      //   mainAxisAlignment: widget.config.mainAxisAlignment,
      //   children: [
      //     if (widget.showPrevButton)
      //       widget.prevButtonBuilder?.call(context) ??
      //           PaginatorButton(
      //             onPressed: _controller.currentPage > 0 ? _controller.prev : null,
      //             child: widget.prevButtonContent,
      //           ),
      //     ..._buildCenterContent(),
      //     if (widget.showNextButton)
      //       widget.nextButtonBuilder?.call(context) ??
      //           PaginatorButton(
      //             onPressed:
      //                 _controller.currentPage < widget.numberPages - 1 ? _controller.next : null,
      //             child: widget.nextButtonContent,
      //           ),
      //   ],
      // ),
    );
  }
}
