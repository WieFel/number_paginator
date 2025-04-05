import 'package:flutter/material.dart';

import '../buttons/buttons.dart';
import '../inherited_paginator.dart';
import 'number_content.dart';

class ScrollableNumberContent extends StatefulWidget {
  final MainAxisAlignment mainAxisAlignment;
  final NumberButtonBuilder? buttonBuilder;
  final bool shrinkWrap;

  const ScrollableNumberContent({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.buttonBuilder,
    this.shrinkWrap = false,
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
            shrinkWrap: widget.shrinkWrap,
            itemBuilder: (context, index) =>
                widget.buttonBuilder?.call(context, index, index == currentPage) ??
                NumberButton(index: index, isSelected: index == currentPage),
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
