import 'package:flutter/material.dart';

import '../inherited_paginator.dart';
import 'paginator_button.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);

    return PaginatorButton(
      onPressed: paginator.isNextAllowed ? () => paginator.controller.next() : null,
      child: Icon(Icons.chevron_right),
    );
  }
}
