import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/buttons/paginator_button.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final paginator = InheritedNumberPaginator.of(context);

    return PaginatorButton(
      onPressed: paginator.controller.currentPage < paginator.numberPages - 1
          ? () => paginator.controller.next()
          : null,
      child: Icon(Icons.chevron_right),
    );
  }
}
