import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class BuilderPage extends StatefulWidget {
  const BuilderPage({Key? key}) : super(key: key);

  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
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
        contentBuilder: (index) => Expanded(
          child: Center(
            child: Text("Currently selected page: ${index + 1}"),
          ),
        ),
        onPageChange: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
