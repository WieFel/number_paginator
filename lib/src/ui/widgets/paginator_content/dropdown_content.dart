import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';

class DropDownContent extends StatelessWidget {
  final int currentPage;

  /// Total number of pages that should be shown.
  final int numberPages;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  const DropDownContent({
    Key? key,
    required this.currentPage,
    required this.numberPages,
    this.onPageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      isExpanded: true,
      value: currentPage,
      selectedItemBuilder: (context) => List.generate(
        numberPages,
        (index) => DropdownMenuItem(
          value: index,
          child: Text(
            (index + 1).toString(),
          ),
        ),
      ),
      items: List.generate(
        numberPages,
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
      onChanged: (index) => onPageChange?.call(index ?? 0),
    );
  }

  /// Checks if the given index is currently selected.
  bool _selected(index) => index == currentPage;
}
