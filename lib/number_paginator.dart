library number_paginator;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_paginator/paginator_button.dart';

class NumberPaginator extends StatefulWidget {
  final int numberPages;
  final int initialPage;
  final Function(int) onPageChange;
  final int pageOptionsShown;

  NumberPaginator({
    @required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    this.pageOptionsShown = 5,
  });

  @override
  _NumberPaginatorState createState() => _NumberPaginatorState();
}

class _NumberPaginatorState extends State<NumberPaginator> {
  int _currentPage;

  @override
  void initState() {
    _currentPage = widget.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PaginatorButton(
          onPressed: _currentPage > 0 ? _prev : null,
          child: Icon(Icons.chevron_left),
        ),
        Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: _generateButtonList())),
            ),
            if (_dotsShouldShow) Text("..."),
            _buildPageButton(widget.numberPages - 1),
          ]),
        ),
        PaginatorButton(
          onPressed: _currentPage < widget.numberPages - 1 ? _next : null,
          child: Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  _prev() {
    setState(() {
      _currentPage--;
    });
    widget.onPageChange?.call(_currentPage + 1);
  }

  _next() {
    setState(() {
      _currentPage++;
    });
    widget.onPageChange?.call(_currentPage + 1);
  }

  bool get _dotsShouldShow =>
      _currentPage < widget.numberPages - 1 - widget.pageOptionsShown ~/ 2 - 1;

  List<Widget> _generateButtonList() {
    int minValue, maxValue;
    minValue = max(0, _currentPage - widget.pageOptionsShown ~/ 2);
    maxValue = min(minValue + widget.pageOptionsShown, widget.numberPages - 1);
    if (maxValue - minValue < widget.pageOptionsShown)
      minValue =
          (maxValue - widget.pageOptionsShown).clamp(0, widget.numberPages - 1);

    return List.generate(
        maxValue - minValue, (index) => _buildPageButton(minValue + index));
  }

  _buildPageButton(index) => PaginatorButton(
        onPressed: () {
          setState(() {
            _currentPage = index;
          });
          widget.onPageChange?.call(index + 1);
        },
        selected: _selected(index),
        child: Text(
          (index + 1).toString(),
          style: TextStyle(color: _selected(index) ? Colors.white : null),
        ),
      );

  bool _selected(index) => index == _currentPage;
}
