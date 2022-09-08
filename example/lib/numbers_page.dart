import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  _NumbersPageState createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
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
      // by default, the paginator shows numbers as center content
      bottomNavigationBar: NumberPaginator(
        numberPages: _numPages,
        onPageChange: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
