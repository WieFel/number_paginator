import 'package:flutter/material.dart';
import 'package:number_paginator/src/model/display_mode.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/number_content.dart';

class PaginatorContent extends StatelessWidget {
  final int currentPage;

  /// Total number of pages that should be shown.
  final int numberPages;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  const PaginatorContent({
    Key? key,
    required this.currentPage,
    required this.numberPages,
    this.onPageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mode = InheritedNumberPaginator.of(context).config.mode;

    switch (mode) {
      case ContentDisplayMode.numbers:
        return NumberContent(
          currentPage: currentPage,
          numberPages: numberPages,
          onPageChange: onPageChange,
        );
      default:
        return Container();
    }
  }
}
