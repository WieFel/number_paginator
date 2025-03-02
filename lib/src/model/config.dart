import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

/// Holds all the relevant information for the configuration of how the
/// [NumberPaginator] should look like.
class NumberPaginatorUIConfig {
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

  /// The [ContentDisplayMode] for the center content of the number paginator.
  final ContentDisplayMode mode;

  /// The [MainAxisAlignment] of the [Row] that holds the prev/next buttons and
  /// the page number buttons. This property only takes effect if [mode] is set to
  /// [ContentDisplayMode.hidden].
  ///
  /// Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// The [MainAxisAlignment] of the [Row] that holds the number buttons.
  /// This property only takes effect if [mode] is set to [ContentDisplayMode.numbers].
  ///
  /// Defaults to [MainAxisAlignment.spaceAround].
  final MainAxisAlignment numbersMainAxisAlignment;

  /// The [EdgeInsets] that should be used as padding for the number paginator's
  /// content.
  final EdgeInsets? contentPadding;

  /// The [TextStyle] that should be used for the [PaginatorButton]'s text.
  /// This property only takes effect if [mode] is set to
  /// [ContentDisplayMode.numbers].
  /// The color of the text is determined by [buttonSelectedForegroundColor] and
  /// [buttonUnselectedForegroundColor].
  final TextStyle? buttonTextStyle;

  /// The [Padding] that should be used for the [PaginatorButton]'s content.
  final EdgeInsetsGeometry? buttonPadding;

  const NumberPaginatorUIConfig({
    this.height = 48.0,
    this.buttonShape,
    this.buttonSelectedForegroundColor,
    this.buttonUnselectedForegroundColor,
    this.buttonSelectedBackgroundColor,
    this.buttonUnselectedBackgroundColor,
    this.mode = ContentDisplayMode.numbers,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.numbersMainAxisAlignment = MainAxisAlignment.spaceAround,
    this.contentPadding,
    this.buttonTextStyle,
    this.buttonPadding,
  });
}
