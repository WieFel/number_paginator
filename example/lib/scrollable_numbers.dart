import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class ScrollableNumbers extends StatefulWidget {
  const ScrollableNumbers({Key? key}) : super(key: key);

  @override
  _ScrollableNumbersState createState() => _ScrollableNumbersState();
}

class _ScrollableNumbersState extends State<ScrollableNumbers> {
  final int _numPages = 100;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      _numPages,
          (index) => Center(
        child: Text(
          "Page ${index + 1}",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: pages[_currentPage],
      // card for elevation
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: NumberPaginator(
          config: const NumberPaginatorUIConfig(mode: ContentDisplayMode.scrollableNumbers),
          numberPages: _numPages,
          onPageChange: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}
