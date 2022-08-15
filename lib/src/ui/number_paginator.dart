import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';
import 'package:number_paginator/src/model/config.dart';
import 'package:number_paginator/src/model/display_mode.dart';
import 'package:number_paginator/src/ui/widgets/paginator_button.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content.dart';

class NumberPaginator extends StatefulWidget {
  /// Total number of pages that should be shown.
  final int numberPages;

  /// Index of initially selected page.
  final int initialPage;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  /// The UI config for the [NumberPaginator].
  final NumberPaginatorConfig config;

  /// Creates an instance of [NumberPaginator].
  const NumberPaginator({
    Key? key,
    required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    this.config = const NumberPaginatorConfig(),
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
    return InheritedNumberPaginator(
      numberPages: widget.numberPages,
      initialPage: widget.initialPage,
      onPageChange: widget.onPageChange,
      config: widget.config,
      child: SizedBox(
        height: widget.config.height,
        child: Row(
          mainAxisAlignment: widget.config.mainAxisAlignment,
          children: [
            PaginatorButton(
              onPressed: _currentPage > 0 ? _prev : null,
              child: const Icon(Icons.chevron_left),
            ),
            if (widget.config.mode != ContentDisplayMode.hidden)
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
            ),
          ],
        ),
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
