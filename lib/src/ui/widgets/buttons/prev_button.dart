import 'package:flutter/material.dart';

import '../inherited_paginator.dart';
import 'paginator_button.dart';

class PrevButton extends StatelessWidget {
  const PrevButton({super.key});

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);

    return PaginatorButton(
      onPressed: paginator.isPrevAllowed ? () => paginator.controller.prev() : null,
      child: Icon(Icons.chevron_left),
    );
  }
}
