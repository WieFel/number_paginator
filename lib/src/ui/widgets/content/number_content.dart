import 'dart:math';

import 'package:flutter/material.dart';

import '../buttons/buttons.dart';
import '../inherited_paginator.dart';

typedef NumberButtonBuilder = Widget Function(BuildContext context, int index);

class NumberContent extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final NumberButtonBuilder? buttonBuilder;

  const NumberContent({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.buttonBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final numberPages = InheritedNumberPaginator.of(context).numberPages;

    return LayoutBuilder(
      builder: (context, constraints) {
        /// Buttons have an aspect ratio of 1:1. Therefore use paginator height as
        /// button width.
        var buttonWidth = constraints.maxHeight;
        var availableSpots = (constraints.maxWidth / buttonWidth).floor();

        return Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            _buildPageButton(context, 0),
            if (_frontDotsShouldShow(context, availableSpots)) _buildDots(context),
            if (numberPages > 1) ..._generateButtonList(context, availableSpots),
            if (_backDotsShouldShow(context, availableSpots)) _buildDots(context),
            if (numberPages > 1) _buildPageButton(context, numberPages - 1),
          ],
        );
      },
    );
  }

  /// Generates the variable button list which is at the center of the (optional)
  /// dots. The very last and first pages are shown independently of this list.
  List<Widget> _generateButtonList(BuildContext context, int availableSpots) {
    // if dots shown: available minus (2 for first and last pages + 2 for dots)
    var shownPages = availableSpots -
        2 -
        (_backDotsShouldShow(context, availableSpots) ? 1 : 0) -
        (_frontDotsShouldShow(context, availableSpots) ? 1 : 0);

    final paginator = InheritedNumberPaginator.of(context);
    final numberPages = paginator.numberPages;

    int minValue, maxValue;
    minValue = max(1, paginator.currentPage - shownPages ~/ 2);
    maxValue = min(minValue + shownPages, numberPages - 1);
    if (maxValue - minValue < shownPages) {
      minValue = (maxValue - shownPages).clamp(1, numberPages - 1);
    }

    return List.generate(
      maxValue - minValue,
      (index) => _buildPageButton(context, minValue + index),
    );
  }

  /// Builds a button for the given index.
  Widget _buildPageButton(BuildContext context, int index) {
    if (buttonBuilder != null) return buttonBuilder!(context, index);

    final paginator = InheritedNumberPaginator.of(context);

    return PaginatorButton(
      onPressed: () => paginator.onPageChange?.call(index),
      selected: index == paginator.currentPage,
      child: Text((index + 1).toString(), maxLines: 1),
    );
  }

  Widget _buildDots(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.bottomCenter,
          child: Text("..."),
        ),
      );

  /// Checks if pages don't fit in available spots and dots have to be shown.
  bool _backDotsShouldShow(BuildContext context, int availableSpots) {
    final paginator = InheritedNumberPaginator.of(context);

    return availableSpots < paginator.numberPages &&
        paginator.currentPage < paginator.numberPages - availableSpots ~/ 2;
  }

  bool _frontDotsShouldShow(BuildContext context, int availableSpots) {
    final paginator = InheritedNumberPaginator.of(context);

    return availableSpots < paginator.numberPages &&
        paginator.currentPage > availableSpots ~/ 2 - 1;
  }
}
