import 'package:flutter/material.dart';
import 'package:number_paginator/src/model/display_mode.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/dropdown_content.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/number_content.dart';

class PaginatorContent extends StatelessWidget {
  final int currentPage;

  const PaginatorContent({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mode = InheritedNumberPaginator.of(context).config.mode;

    switch (mode) {
      case ContentDisplayMode.numbers:
        return NumberContent(
          currentPage: currentPage,
        );
      case ContentDisplayMode.dropdown:
        return DropDownContent(
          currentPage: currentPage,
        );
      default:
        return Container();
    }
  }
}
