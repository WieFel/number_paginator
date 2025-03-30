import 'package:flutter/material.dart';

class PaginatorButton extends StatelessWidget {
  /// Callback for button press.
  final VoidCallback? onPressed;

  /// The child of the button.
  final Widget child;

  /// Whether the button is currently selected.
  final bool selected;

  /// Creates an instance of [PaginatorButton].
  const PaginatorButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: _backgroundColor(context, selected),
            foregroundColor: _foregroundColor(context, selected),
            padding: EdgeInsets.zero,
          ),
          child: child,
        ),
      ),
    );
  }

  Color? _backgroundColor(BuildContext context, bool selected) =>
      selected ? Theme.of(context).colorScheme.secondary : null;

  Color? _foregroundColor(BuildContext context, bool selected) =>
      selected ? Theme.of(context).colorScheme.onSecondary : null;
}
