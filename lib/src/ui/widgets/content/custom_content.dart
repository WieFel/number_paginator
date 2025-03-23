import 'package:flutter/material.dart';

import '../inherited_paginator.dart';

typedef CustomContentBuilder = Widget Function(BuildContext context, int currentPage);

class CustomContent extends StatelessWidget {
  final CustomContentBuilder builder;

  const CustomContent({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      InheritedNumberPaginator.of(context).controller.currentPage,
    );
  }
}
