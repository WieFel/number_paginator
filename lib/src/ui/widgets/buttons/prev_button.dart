import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/buttons/paginator_button.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';

class PrevButton extends StatelessWidget {
  const PrevButton({super.key});

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);

    return PaginatorButton(
      onPressed: paginator.controller.currentPage > 0
          ? () => InheritedNumberPaginator.of(context).controller.prev()
          : null,
      child: Icon(Icons.chevron_left),
    );
  }
}
