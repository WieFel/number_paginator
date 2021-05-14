import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _numPages = 10;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      _numPages,
      (index) => Center(
        child: Text("Page ${index + 1}"),
      ),
    );

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Number Paginator Demo"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: pages[_currentPage],
              ),
            ),
            NumberPaginator(
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
