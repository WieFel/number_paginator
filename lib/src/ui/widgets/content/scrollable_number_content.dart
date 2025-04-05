import 'package:flutter/material.dart';

import '../buttons/buttons.dart';
import '../inherited_paginator.dart';
import 'number_content.dart';

class ScrollableNumberContent extends StatefulWidget {
  final MainAxisAlignment mainAxisAlignment;
  final NumberButtonBuilder? buttonBuilder;

  const ScrollableNumberContent({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.buttonBuilder,
  });

  @override
  State<ScrollableNumberContent> createState() => _ScrollableNumberContentState();
}

class _ScrollableNumberContentState extends State<ScrollableNumberContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final numberPages = InheritedNumberPaginator.of(context).numberPages;

    return LayoutBuilder(builder: (context, constraints) {
      final itemWidth = constraints.maxHeight;

      return ValueListenableBuilder<int>(
        valueListenable: InheritedNumberPaginator.of(context).controller,
        builder: (context, currentPage, child) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToItem(
              currentPage,
              itemWidth,
              constraints.maxWidth,
            ),
          );

          return ListView.builder(
            controller: _scrollController,
            itemCount: numberPages,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                widget.buttonBuilder?.call(context, index, index == currentPage) ??
                _NumberButton(index, currentPage),
          );
        },
      );
    });
  }

  void _scrollToItem(int index, double itemWidth, double totalWidth) {
    double offset = index * itemWidth - totalWidth / 2 + itemWidth / 2;
    offset = offset.clamp(
      _scrollController.position.minScrollExtent,
      _scrollController.position.maxScrollExtent,
    );
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
