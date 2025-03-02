import 'package:flutter/material.dart';
import 'package:number_paginator/src/model/display_mode.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/dropdown_content.dart';
import 'package:number_paginator/src/ui/widgets/paginator_content/number_content.dart';

class PaginatorContent extends StatelessWidget {
  final int currentPage;

  const PaginatorContent({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    var config = InheritedNumberPaginator.of(context).config;

    switch (config.mode) {
      case ContentDisplayMode.numbers:
        return NumberContent(
          currentPage: currentPage,
        );
      case ContentDisplayMode.dropdown:
        return DropDownContent(
          currentPage: currentPage,
        );
      default:
        return SizedBox();
    }
  }
}
