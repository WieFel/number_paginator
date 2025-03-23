import 'package:flutter/material.dart';

import '../inherited_number_paginator.dart';
import 'paginator_button.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);

    return PaginatorButton(
      onPressed: paginator.controller.currentPage < paginator.numberPages - 1
          ? () => paginator.controller.next()
          : null,
      child: Icon(Icons.chevron_right),
    );
  }
}
