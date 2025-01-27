import 'package:flutter/material.dart';
import 'package:number_paginator/src/model/display_mode.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/dropdown_content.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/number_content.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/scrollable_numbers_content.dart';

class PaginatorContent extends StatelessWidget {
  final int currentPage;

  const PaginatorContent({
  super.key,
  required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    var mode = InheritedNumberPaginator.of(context).config.mode;

    switch (mode) {
      case ContentDisplayMode.numbers:
        return NumberContent(currentPage: currentPage);
      case ContentDisplayMode.dropdown:
        return DropDownContent(currentPage: currentPage);
      case ContentDisplayMode.scrollableNumbers:
        return ScrollableNumberContent(currentPage: currentPage);
      default:
        return Container();
    }
  }
}
