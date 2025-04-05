import 'package:flutter/material.dart';

import '../buttons/buttons.dart';
import '../inherited_paginator.dart';
import 'number_content.dart';

class ScrollableNumberContent extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final NumberButtonBuilder? buttonBuilder;

  const ScrollableNumberContent({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.buttonBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final numberPages = InheritedNumberPaginator.of(context).numberPages;

    return ValueListenableBuilder<int>(
      valueListenable: InheritedNumberPaginator.of(context).controller,
      builder: (context, currentPage, child) => ListView.builder(
        itemCount: numberPages,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            buttonBuilder?.call(context, index, index == currentPage) ??
            _NumberButton(index, currentPage),
      ),
    );
  }
}

class _NumberButton extends StatelessWidget {
  final int index;
  final int currentPage;

  const _NumberButton(this.index, this.currentPage);

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);

    return PaginatorButton(
      onPressed: () => paginator.onPageChange?.call(index),
      selected: index == currentPage,
      child: Text((index + 1).toString(), maxLines: 1),
    );
  }
}
