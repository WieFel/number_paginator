import 'package:flutter/material.dart';

import '../inherited_number_paginator.dart';

class DropDownContent extends StatelessWidget {
  const DropDownContent({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPage = InheritedNumberPaginator.of(context).controller.currentPage;
    selected(index) => index == currentPage;

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
              color: selected(index) ? Theme.of(context).colorScheme.secondary : null,
            ),
          ),
        ),
      ),
      onChanged: (index) => InheritedNumberPaginator.of(context).onPageChange?.call(index ?? 0),
    );
  }
}
