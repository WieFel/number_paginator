import 'package:flutter/material.dart';

import '../inherited_paginator.dart';

class DropDownContent extends StatelessWidget {
  const DropDownContent({super.key});

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);
    final currentPage = paginator.controller.currentPage;
    selected(index) => index == currentPage;

    return DropdownButton<int>(
      isExpanded: true,
      value: currentPage,
      selectedItemBuilder: (context) => List.generate(
        paginator.numberPages,
        (index) => DropdownMenuItem(
          value: index,
          child: Text(
            (index + 1).toString(),
          ),
        ),
      ),
      items: List.generate(
        paginator.numberPages,
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
      onChanged: (index) => paginator.onPageChange?.call(index ?? 0),
    );
  }
}
