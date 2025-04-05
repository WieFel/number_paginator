import 'package:flutter/material.dart';

import '../../../../number_paginator.dart';

/// Paginator button that is specifically made for showing numbers. Used in [NumberContent] and
/// [ScrollableNumberContent].
class NumberButton extends StatelessWidget {
  /// The index of the button. This gets displayed as `index + 1`.
  final int index;

  /// Whether the button is selected or not.
  final bool isSelected;

  /// Creates an instance of NumberButton.
  const NumberButton({
    super.key,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatorButton(
      onPressed: () => InheritedNumberPaginator.of(context).onPageChange?.call(index),
      selected: isSelected,
      child: Text((index + 1).toString(), maxLines: 1),
    );
  }
}
