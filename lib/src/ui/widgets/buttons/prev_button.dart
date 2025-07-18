import 'package:flutter/material.dart';

import '../inherited_paginator.dart';
import 'paginator_button.dart';

class PrevButton extends StatelessWidget {
  final Widget? child;

  const PrevButton({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final controller = InheritedNumberPaginator.of(context).controller;

    return ValueListenableBuilder<int>(
      valueListenable: controller,
      builder: (context, currentPage, child) {
        final prevAllowed = currentPage > 0;
        return PaginatorButton(
          onPressed: prevAllowed ? () => controller.prev() : null,
          child: child!,
        );
      },
      child: child ?? Icon(Icons.chevron_left),
    );
  }
}
