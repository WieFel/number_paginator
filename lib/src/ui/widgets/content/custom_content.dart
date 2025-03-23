import 'package:flutter/material.dart';

import '../inherited_number_paginator.dart';

typedef CustomContentBuilder = Widget Function(BuildContext context, int currentPage);

class CustomContent extends StatelessWidget {
  final CustomContentBuilder builder;

  const CustomContent({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final currentPage = InheritedNumberPaginator.of(context).controller.currentPage;

    return builder(context, currentPage);
  }
}
