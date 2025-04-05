import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class ScrollableNumbersPage extends StatefulWidget {
  const ScrollableNumbersPage({Key? key}) : super(key: key);

  @override
  _ScrollableNumbersPageState createState() => _ScrollableNumbersPageState();
}

class _ScrollableNumbersPageState extends State<ScrollableNumbersPage> {
  final int _numPages = 10;
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
      bottomNavigationBar: Material(
        child: NumberPaginator(
          numberPages: _numPages,
          onPageChange: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
          child: const SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrevButton(),
                Flexible(child: ScrollableNumberContent()),
                NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
