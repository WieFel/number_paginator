import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';

class DropDownContent extends StatelessWidget {
  final int currentPage;

  const DropDownContent({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      isExpanded: true,
      value: currentPage,
      selectedItemBuilder: (context) => List.generate(
        InheritedNumberPaginator.of(context).numberPages,
        (index) => DropdownMenuItem(
          value: index,
          child: Text(
            (index + 1).toString(),
          ),
        ),
      ),
      items: List.generate(
        InheritedNumberPaginator.of(context).numberPages,
        (index) => DropdownMenuItem(
          value: index,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
              color: _selected(index)
                  ? InheritedNumberPaginator.of(context)
                          .config
                          .buttonSelectedBackgroundColor ??
                      Theme.of(context).colorScheme.secondary
                  : null,
            ),
          ),
        ),
      ),
      onChanged: (index) =>
          InheritedNumberPaginator.of(context).onPageChange?.call(index ?? 0),
    );
  }

  /// Checks if the given index is currently selected.
  bool _selected(index) => index == currentPage;
}
