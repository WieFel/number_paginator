import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/buttons/paginator_button.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';

class ScrollableNumberContent extends StatelessWidget {
  final int currentPage;

  const ScrollableNumberContent({
  super.key,
  required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    var numberPages = InheritedNumberPaginator.of(context).numberPages;

    return SizedBox(
      //height: 50, // Set a fixed height
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Enable scrolling
        itemCount: numberPages,
        itemBuilder: (context, index) {
          return _buildPageButton(context, index);
        },
      ),
    );
  }

  /// Builds a **clickable page button**.
  Widget _buildPageButton(BuildContext context, int index) => PaginatorButton(
    onPressed: () =>
        InheritedNumberPaginator.of(context).onPageChange?.call(index),
    selected: index == currentPage,
    child: AutoSizeText(
      (index + 1).toString(),
      maxLines: 1,
      minFontSize: 5,
    ),
  );
}
