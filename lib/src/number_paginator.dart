import 'package:flutter/material.dart';
import 'package:number_paginator/src/paginator_button.dart';
import 'package:number_paginator/src/paginator_content.dart';

class NumberPaginator extends StatefulWidget {
  /// Total number of pages that should be shown.
  final int numberPages;

  /// Index of initially selected page.
  final int initialPage;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  /// The height of the number paginator.
  final double height;

  /// The shape of the [PaginatorButton]s.
  final OutlinedBorder? buttonShape;

  /// The [PaginatorButton]'s foreground color (text/icon color) when selected.
  ///
  /// Defaults to [Colors.white].
  final Color? buttonSelectedForegroundColor;

  /// The [PaginatorButton]'s foreground color (text/icon color) when unselected.
  ///
  /// Defaults to `null`.
  final Color? buttonUnselectedForegroundColor;

  /// The [PaginatorButton]'s background color when selected.
  ///
  /// Defaults to the [Theme]'s accent color.
  final Color? buttonSelectedBackgroundColor;

  /// The [PaginatorButton]'s background color when unselected.
  ///
  /// Defaults to `null`.
  final Color? buttonUnselectedBackgroundColor;

  /// Flag indicating whether the page numbers should be shown or not. If set to
  /// `false`, only the prev/next buttons are shown.
  ///
  /// Defaults to `true`.
  final bool showPageNumbers;

  /// The [MainAxisAlignment] of the [Row] that holds the prev/next buttons and
  /// the page number buttons. This property only takes effect if
  /// [showPageNumbers] is `false`.
  ///
  /// Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// Creates an instance of [NumberPaginator].
  const NumberPaginator({
    Key? key,
    required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    this.height = 48.0,
    this.buttonShape,
    this.buttonSelectedForegroundColor,
    this.buttonUnselectedForegroundColor,
    this.buttonSelectedBackgroundColor,
    this.buttonUnselectedBackgroundColor,
    this.showPageNumbers = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  _NumberPaginatorState createState() => _NumberPaginatorState();
}

class _NumberPaginatorState extends State<NumberPaginator> {
  late int _currentPage;

  @override
  void initState() {
    _currentPage = widget.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: [
          PaginatorButton(
            onPressed: _currentPage > 0 ? _prev : null,
            child: const Icon(Icons.chevron_left),
            shape: widget.buttonShape,
            selectedForegroundColor: widget.buttonSelectedForegroundColor,
            unSelectedforegroundColor: widget.buttonUnselectedForegroundColor,
            selectedBackgroundColor: widget.buttonSelectedBackgroundColor,
            unSelectedBackgroundColor: widget.buttonUnselectedBackgroundColor,
          ),
          if (widget.showPageNumbers)
            Expanded(
              child: PaginatorContent(
                currentPage: _currentPage,
                numberPages: widget.numberPages,
                onPageChange: _navigateToPage,
              ),
            ),
          PaginatorButton(
            onPressed: _currentPage < widget.numberPages - 1 ? _next : null,
            child: const Icon(Icons.chevron_right),
            shape: widget.buttonShape,
            selectedForegroundColor: widget.buttonSelectedForegroundColor,
            unSelectedforegroundColor: widget.buttonUnselectedForegroundColor,
            selectedBackgroundColor: widget.buttonSelectedBackgroundColor,
            unSelectedBackgroundColor: widget.buttonUnselectedBackgroundColor,
          ),
        ],
      ),
    );
  }

  _prev() {
    setState(() {
      _currentPage--;
    });
    widget.onPageChange?.call(_currentPage);
  }

  _next() {
    setState(() {
      _currentPage++;
    });
    widget.onPageChange?.call(_currentPage);
  }

  _navigateToPage(int index) {
    setState(() {
      _currentPage = index;
    });
    widget.onPageChange?.call(index);
  }
}
