import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class OnlyArrowsPage extends StatefulWidget {
  const OnlyArrowsPage({Key? key}) : super(key: key);

  @override
  _OnlyArrowsPageState createState() => _OnlyArrowsPageState();
}

class _OnlyArrowsPageState extends State<OnlyArrowsPage> {
  final int _numPages = 10;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      _numPages,
      (index) => Center(
        child: Text("Page ${index + 1}"),
      ),
    );

    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: pages[_currentPage],
      ),
      bottomNavigationBar: NumberPaginator(
        numberPages: _numPages,
        // shows only default arrows, no center content of paginator
        config: const NumberPaginatorUIConfig(mode: ContentDisplayMode.hidden),
        onPageChange: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
