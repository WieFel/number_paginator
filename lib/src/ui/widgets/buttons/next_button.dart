import 'package:flutter/material.dart';

import '../inherited_paginator.dart';
import 'paginator_button.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);

    return ValueListenableBuilder<int>(
      valueListenable: paginator.controller,
      builder: (context, currentPage, child) {
        final nextAllowed = currentPage < paginator.numberPages - 1;
        return PaginatorButton(
          onPressed: nextAllowed ? () => paginator.controller.next() : null,
          child: child!,
        );
      },
      child: Icon(Icons.chevron_right),
    );
  }
}
