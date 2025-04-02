import 'dart:math';

import 'package:flutter/material.dart';

import '../buttons/buttons.dart';
import '../inherited_paginator.dart';

typedef NumberButtonBuilder = Widget Function(
    BuildContext context, int index, bool isSelected);

class NumberContent extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final NumberButtonBuilder? buttonBuilder;

  const NumberContent({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
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

        return ValueListenableBuilder<int>(
          valueListenable: InheritedNumberPaginator.of(context).controller,
          builder: (context, currentPage, child) => Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              _buildPageButton(context, currentPage, 0),
              if (_frontDotsShouldShow(
                  numberPages, currentPage, availableSpots))
                _Dots(),
              if (numberPages > 1)
                ..._generateButtonList(context, currentPage, availableSpots),
              if (_backDotsShouldShow(numberPages, currentPage, availableSpots))
                _Dots(),
              if (numberPages > 1)
                _buildPageButton(context, currentPage, numberPages - 1),
            ],
          ),
        );
      },
    );
  }

  /// Generates the variable button list which is at the center of the (optional)
  /// dots. The very last and first pages are shown independently of this list.
  List<Widget> _generateButtonList(
      BuildContext context, int currentPage, int availableSpots) {
    final numberPages = InheritedNumberPaginator.of(context).numberPages;
    // if dots shown: available minus (2 for first and last pages + 2 for dots)
    final shownPages = availableSpots -
        2 -
        (_backDotsShouldShow(numberPages, currentPage, availableSpots)
            ? 1
            : 0) -
        (_frontDotsShouldShow(numberPages, currentPage, availableSpots)
            ? 1
            : 0);

    var minValue = max(1, currentPage - shownPages ~/ 2);
    final maxValue = min(minValue + shownPages, numberPages - 1);
    if (maxValue - minValue < shownPages) {
      minValue = (maxValue - shownPages).clamp(1, numberPages - 1);
    }

    return List.generate(
      maxValue - minValue,
      (index) => _buildPageButton(context, currentPage, minValue + index),
    );
  }

  /// Builds a button for the given index.
  Widget _buildPageButton(BuildContext context, int currentPage, int index) {
    if (buttonBuilder != null)
      return buttonBuilder!(context, index, index == currentPage);

    return _NumberButton(index, currentPage);
  }

  /// Checks if pages don't fit in available spots and dots have to be shown.
  bool _backDotsShouldShow(
      int numberPages, int currentPage, int availableSpots) {
    return availableSpots < numberPages &&
        currentPage < numberPages - availableSpots ~/ 2;
  }

  bool _frontDotsShouldShow(
      int numberPages, int currentPage, int availableSpots) {
    return availableSpots < numberPages &&
        currentPage > availableSpots ~/ 2 - 1;
  }
}

class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        margin: const EdgeInsets.all(4.0),
        alignment: Alignment.bottomCenter,
        child: Text("..."),
      ),
    );
  }
}

class _NumberButton extends StatelessWidget {
  final int index;
  final int currentPage;

  const _NumberButton(this.index, this.currentPage);

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);

    return PaginatorButton(
      onPressed: () => paginator.onPageChange?.call(index),
      selected: index == currentPage,
      child: Text((index + 1).toString(), maxLines: 1),
    );
  }
}
