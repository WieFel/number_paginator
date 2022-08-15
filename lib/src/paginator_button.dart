import 'package:flutter/material.dart';

class PaginatorButton extends StatelessWidget {
  /// Callback for button press.
  final VoidCallback? onPressed;

  /// The child of the button.
  final Widget child;

  /// Whether the button is currently selected.
  final bool selected;

  /// The shape of the button as an [OutlinedBorder].
  ///
  /// Defaults to [CircleBorder].
  final OutlinedBorder? shape;

  /// The button's background color when selected.
  final Color? selectedBackgroundColor;

  /// The button's background color when not selected.
  final Color? unSelectedBackgroundColor;

  /// The button's foreground color when selected.
  final Color? selectedForegroundColor;

  /// The button's foreground color when not selected.
  final Color? unSelectedforegroundColor;

  /// Creates an instance of [PaginatorButton].
  const PaginatorButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.selected = false,
    this.shape,
    this.selectedBackgroundColor,
    this.unSelectedBackgroundColor,
    this.selectedForegroundColor,
    this.unSelectedforegroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: shape ?? const CircleBorder(),
            backgroundColor: _backgroundColor(context, selected),
            primary: _foregroundColor(context, selected),
          ),
          child: child,
        ),
      ),
    );
  }

  Color? _backgroundColor(BuildContext context, bool selected) => selected
      ? (selectedBackgroundColor ?? Theme.of(context).colorScheme.secondary)
      : unSelectedBackgroundColor;

  Color? _foregroundColor(BuildContext context, bool selected) => selected
      ? (selectedForegroundColor ?? Colors.white)
      : unSelectedforegroundColor;
}
