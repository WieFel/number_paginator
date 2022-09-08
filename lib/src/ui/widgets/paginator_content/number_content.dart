import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';
import 'package:number_paginator/src/ui/widgets/paginator_button.dart';

class NumberContent extends StatelessWidget {
  final int currentPage;

  const NumberContent({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /// Buttons have an aspect ratio of 1:1. Therefore use paginator height as
        /// button width.
        var buttonWidth = constraints.maxHeight;
        var availableSpots = (constraints.maxWidth / buttonWidth).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ..._generateButtonList(context, availableSpots),
            if (_dotsShouldShow(context, availableSpots)) _buildDots(context),
            _buildPageButton(
                context, InheritedNumberPaginator.of(context).numberPages - 1),
          ],
        );
      },
    );
  }

  /// Generates the variable button list which is on the left of the (optional)
  /// dots. The very last page is shown independently of this list.
  List<Widget> _generateButtonList(BuildContext context, int availableSpots) {
    // if dots shown: available minus one for last page + one for dots
    var shownPages = _dotsShouldShow(context, availableSpots)
        ? availableSpots - 2
        : availableSpots - 1;
    var numberPages = InheritedNumberPaginator.of(context).numberPages;

    int minValue, maxValue;
    minValue = max(0, currentPage - shownPages ~/ 2);
    maxValue = min(minValue + shownPages, numberPages - 1);
    if (maxValue - minValue < shownPages) {
      minValue = (maxValue - shownPages).clamp(0, numberPages - 1);
    }

    return List.generate(maxValue - minValue,
        (index) => _buildPageButton(context, minValue + index));
  }

  /// Builds a button for the given index.
  Widget _buildPageButton(BuildContext context, int index) => PaginatorButton(
        onPressed: () =>
            InheritedNumberPaginator.of(context).onPageChange?.call(index),
        selected: _selected(index),
        child:
            AutoSizeText((index + 1).toString(), maxLines: 1, minFontSize: 5),
      );

  Widget _buildDots(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          // padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.bottomCenter,
          decoration: ShapeDecoration(
            shape: InheritedNumberPaginator.of(context).config.buttonShape ??
                const CircleBorder(),
            color: InheritedNumberPaginator.of(context)
                .config
                .buttonUnselectedBackgroundColor,
          ),
          child: Icon(
            Icons.more_horiz,
            color: InheritedNumberPaginator.of(context)
                    .config
                    .buttonUnselectedForegroundColor ??
                Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
        ),
      );

  /// Checks if pages don't fit in available spots and dots have to be shown.
  bool _dotsShouldShow(BuildContext context, int availableSpots) =>
      availableSpots < InheritedNumberPaginator.of(context).numberPages &&
      currentPage <
          InheritedNumberPaginator.of(context).numberPages -
              availableSpots ~/ 2 -
              1;

  /// Checks if the given index is currently selected.
  bool _selected(index) => index == currentPage;
}
