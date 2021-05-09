import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _numPages = 10;
  List<Widget> _pages;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      _numPages,
      (index) => Center(
        child: Text("Page ${index + 1}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Number Paginator Demo"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: _pages[_currentPage],
              ),
            ),
            NumberPaginator(
              pageOptionsShown: 4,
              numberPages: _numPages,
              onPageChange: (int index) {
                setState(() {
                  _currentPage = index - 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
