import 'package:flutter/material.dart';

class PaginatorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool selected;

  PaginatorButton(
      {@required this.onPressed, @required this.child, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 16,
      shape: CircleBorder(),
      color: selected ? Theme.of(context).accentColor : null,
      child: child,
    );
  }
}
