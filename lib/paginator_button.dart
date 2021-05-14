import 'package:flutter/material.dart';

class PaginatorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool selected;
  final OutlinedBorder shape;

  PaginatorButton(
      {@required this.onPressed,
      @required this.child,
      this.selected = false,
      this.shape});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: shape ?? CircleBorder(),
            backgroundColor: selected ? Theme.of(context).accentColor : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
