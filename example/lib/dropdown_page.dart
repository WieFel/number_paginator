import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({Key? key}) : super(key: key);

  @override
  _DropdownPageState createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
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
        // shows a dropdown as the center paginator content
        config:
            const NumberPaginatorUIConfig(mode: ContentDisplayMode.dropdown),
        onPageChange: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
